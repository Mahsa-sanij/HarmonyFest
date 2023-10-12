//
//  DetailView.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import SwiftUI
import struct Kingfisher.KFImage

struct DetailView: View {
    
    let item: Entity
    
    var body: some View {
        
        ZStack {
            
            ColorReference.primary.color.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                
                VStack {
                    
                    ZStack(alignment: .bottom) {
                        
                        KFImage(item.image)
                            .resizable()
                            .aspectRatio(CGSize(width: 352, height: 208), contentMode: .fit)
                            .overlay(RoundedCornerView(strokeColor: ColorReference.orange.color, strokeSize: 1, tl: 0, tr: 8, bl: 0, br: 8))
                        
                    }
                    .padding(.leading, -2)
                    .padding(.trailing, 24)
                    .padding(.bottom, 20)
                    
                    PerformanceListView(performances: [.init(id: 1, date: "2023-01-01T20:00:00", entity: Artist(id: 4, name: "Shake The Disease", genre: "Synthpop")), .init(id: 2, date: "2023-01-01T20:00:00", entity: Artist(id: 4, name: "Shake The Disease", genre: "Synthpop")), .init(id: 3, date: "2023-01-01T20:00:00", entity: Artist(id: 4, name: "Shake The Disease", genre: "Synthpop")), .init(id: 4, date: "2023-01-01T20:00:00", entity: Artist(id: 4, name: "Shake The Disease", genre: "Synthpop")), .init(id: 5, date: "2023-01-01T20:00:00", entity: Artist(id: 4, name: "Shake The Disease", genre: "Synthpop"))])
                        .padding(.horizontal, 24)
                        .padding(.bottom, 32)
                    
                }
                .padding(.top, 20)
                
            }
            .navigationBarTitle(item.name ?? "", displayMode: .large)
            
        }
        
        
    }
}

struct PerformanceListView : View {
    
    let performances: [Performance]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                Text(TextReferences.performances)
                    .foregroundColor(ColorReference.white.color)
                    .padding(.leading, 10)
                
                
                Spacer()
                
            }
            
            ZStack(alignment: .leading) {
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(ColorReference.lightBlue.color)
                    .frame(height: 1)
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(ColorReference.orange.color)
                    .frame(width: 120, height: 2, alignment: .leading)
            }
            .padding(.bottom, 18)
            
            ForEach(performances , id: \.id) { item in
                
                ZStack {
                    
                    KFImage(item.entity?.image)
                        .resizable()
                        .aspectRatio(CGSize(width: 320, height: 150), contentMode: .fit)
                    
                    VStack {
                        
                        Spacer()
                        
                        VStack(spacing: 4) {
                            
                            HStack {
                                Text(item.entity?.name ?? "")
                                    .font(Font.system(size: 22, weight: .bold, design: .default))
                                
                                
                                if item.entity is Artist {
                                    
                                    Spacer()
                                    
                                    Text((item.entity as? Artist)?.genre ?? "")
                                        .font(Font.system(size: 16, weight: .regular, design: .default))
                                }
                            }
                            .padding(.horizontal, 16)
                            
                            
                            Text("\(item.getFormattedDate()) at \(item.getFormattedTime())" )
                                .font(Font.system(size: 16, weight: .bold, design: .default))
                        }
                        .padding(.bottom, 16)
                        .padding(.top, 32)
                        .frame(maxWidth: .infinity)
                        .background(Rectangle().foregroundColor(.clear).overlay(LinearGradient(
                            colors: [.black, .black, .clear],
                            startPoint: .bottom,
                            endPoint: .top))
                        )
                        
                    }
                    
                }
                .cornerRadius(8)
                .padding(.vertical, 8)
                
            }
            .scrollContentBackground(.hidden)
        }
        
    }
}


