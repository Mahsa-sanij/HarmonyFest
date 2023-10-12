//
//  MasterView.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import SwiftUI

struct MasterView: View {
    
    @ObservedObject var vm = MasterViewModel()
    
    
    init() {
        
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
                        
                        VStack {
                            
                            Spacer()
                            
                            ProgressView()
                                .progressViewStyle(.circular)
                            
                            Spacer()
                        }
                        
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
                                
                                NavigationLink(destination: DetailView(artistItem: item)) {
                                    
                                    MasterItemView(item: item)
                                        .listRowBackground(Color.clear)
                                }
                                
                            }
                            .scrollContentBackground(.hidden)
                        }
                        else {
                            
                            List(vm.venueList ?? [], id: \.id) { item in
                                
                                NavigationLink(destination: DetailView(venueItem: item)) {
                                    
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


struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
