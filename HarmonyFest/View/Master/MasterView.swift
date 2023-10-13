//
//  MasterView.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import SwiftUI

struct MasterView: View {
    
    
    private var networkClient : NetworkProtocol
    @ObservedObject var vm : MasterViewModel
    
    
    init(networkClient: NetworkProtocol) {
        
        self.networkClient = networkClient
        self.vm = MasterViewModel(networkClient: networkClient)
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                ColorReference.primary.color.edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Picker("", selection: $vm.selectionMode) {
                        ForEach(MasterDisplayMode.allCases) { mode in
                            Text(mode.rawValue.capitalized)
                        }
                    }
                    .padding(.horizontal, 16)
                    .pickerStyle(.segmented)
                    
                    if vm.isLoading {
                        
                        CircularProgressView()
                        
                    }
                    else if vm.error != nil {
                        
                        VStack {
                            
                            Spacer()
                            
                            Text(vm.error ?? "")
                            
                            Spacer()
                        }
                    }
                    else {
                        
                        if vm.selectionMode == .Artists
                        {
                            List(vm.artistList ?? [], id: \.id) { item in
                                
                                NavigationLink(destination: DetailView(networkClient: networkClient , artistItem: item)) {
                                    
                                    MasterItemView(item: item)
                                        .listRowBackground(Color.clear)
                                }
                                
                            }
                            .scrollContentBackground(.hidden)
                        }
                        else {
                            
                            List(vm.venueList ?? [], id: \.id) { item in
                                
                                NavigationLink(destination: DetailView(networkClient: networkClient as! NetworkClient, venueItem: item)) {
                                    
                                    MasterItemView(item: item)
                                        .listRowBackground(Color.clear)
                                }
                                
                            }
                            .scrollContentBackground(.hidden)
                        }
                        
                    }
                    
                }
                
            }
            .navigationBarTitle(TextReferences.title)
            
        }
    }
}

