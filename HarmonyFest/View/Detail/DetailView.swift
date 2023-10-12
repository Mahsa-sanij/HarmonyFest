//
//  DetailView.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import SwiftUI
import struct Kingfisher.KFImage

struct DetailView: View {
    
    @ObservedObject var vm = DetailViewModel()
    
    let artistItem: Artist?
    let venueItem: Venue?
    
    init(artistItem: Artist) {
        self.venueItem = nil
        self.artistItem = artistItem
        self.vm.getPerformances(artistId: artistItem.id ?? 0)
    }
    
    init(venueItem: Venue) {
        self.artistItem = nil
        self.venueItem = venueItem
        self.vm.getPerformances(venueId: venueItem.id ?? 0)
    }
    
    var body: some View {
        
        ZStack {
            
            ColorReference.primary.color.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                
                VStack {
                    
                    ZStack(alignment: .bottom) {
                        
                        KFImage((artistItem != nil ? artistItem : venueItem)?.image)
                            .resizable()
                            .aspectRatio(CGSize(width: 352, height: 208), contentMode: .fit)
                            .overlay(RoundedCornerView(strokeColor: ColorReference.orange.color, strokeSize: 1, tl: 0, tr: 8, bl: 0, br: 8))
                        
                    }
                    .padding(.leading, -2)
                    .padding(.trailing, 24)
                    .padding(.bottom, 20)
                    
                    PerformanceListView(performances: vm.performanceList ?? [])
                        .padding(.horizontal, 24)
                        .padding(.bottom, 32)
                    
                }
                .padding(.top, 20)
                
            }
            .navigationBarTitle((artistItem != nil ? artistItem : venueItem)?.name ?? "", displayMode: .large)
            
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
                    
                    KFImage((item.artist != nil ? item.artist : item.venue)?.image)
                        .resizable()
                        .aspectRatio(CGSize(width: 320, height: 150), contentMode: .fit)

                    VStack {
                        
                        Spacer()
                        
                        VStack(spacing: 4) {
                            
                            HStack {
                                Text((item.artist != nil ? item.artist : item.venue)?.name ?? "")
                                    .font(Font.system(size: 22, weight: .bold, design: .default))
                                
                                
                                if item.artist != nil {
                                    
                                    Spacer()
                                    
                                    Text(item.artist?.genre ?? "")
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
                .overlay(RoundedCornerView(strokeColor: ColorReference.orange.color, strokeSize: 1, tl: 8, tr: 8, bl: 8, br: 8))
                .padding(.vertical, 8)
                
            }
            .scrollContentBackground(.hidden)
        }
        
    }
}


