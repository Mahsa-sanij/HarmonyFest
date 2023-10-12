//
//  MasterView.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import SwiftUI
import struct Kingfisher.KFImage

enum MasterDisplayMode: String, CaseIterable, Identifiable {
    case Artists, Venues
    var id: Self { self }
}

struct MasterView: View {
    
    @State private var selectedMode: MasterDisplayMode = .Artists
    
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
        
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                ColorReference.primary.color.edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Picker("", selection: $selectedMode) {
                        ForEach(MasterDisplayMode.allCases) { mode in
                            Text(mode.rawValue.capitalized)
                        }
                    }
                    .padding(.horizontal, 16)
                    .pickerStyle(.segmented)
                    
                    
                    List([1,2,3,4,5,6] , id: \.self) { item in
                        
                        ArtistItemView(item: .init(id:1 , name: "Vomit Spots", genre: "Punk"))
                            .listRowBackground(Color.clear)
                        
                    }
                    .scrollContentBackground(.hidden)
                    
                }
                
            }
            //        .alert(isPresented: $vm.fetchFailed, content: { () -> Alert in
            //
            //
            //            Alert.init(title: Text(TextRefrences.Add.alert_title),
            //                       message: Text(TextRefrences.Add.alert_message),
            //                       primaryButton: Alert.Button.default(Text(TextRefrences.List.alert_primary_button),
            //                                                           action: {
            //                self.vm.getData()
            //            }),
            //                       secondaryButton : Alert.Button.cancel(Text(TextRefrences.List.alert_secondary_button)))
            //
            //
            //        })
            .navigationBarTitle(TextReferences.title)
            //        .onAppear {
            //            self.vm.getData()
            //        }
            
        }
    }
}

struct ArtistItemView : View {
    
    let item : Artist
    
    var body: some View
    {
        HStack(spacing: 12) {
            
            KFImage(item.image)
                .resizable()
                .frame(width: 64, height: 64)
                .cornerRadius(4)
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text(item.name ?? "")
                    .foregroundColor(ColorReference.primary.color)
                    .font(Font.system(size: 18, weight: .medium, design: .default))
                
                Text(item.genre ?? "")
                    .foregroundColor(ColorReference.primary.color)
                    .font(Font.system(size: 16, weight: .regular, design: .default))
                
            }
            .padding(.vertical, 8)
            
            Spacer()
            
        }
        .padding(.all, 8)
        .background(RoundedRectangle(cornerRadius: 8, style: .circular)
            .foregroundColor(ColorReference.lightBlue.color))
    }
    
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
