//
//  PerformanceListView.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import SwiftUI
import struct Kingfisher.KFImage
import struct Kingfisher.DownsamplingImageProcessor


struct PerformanceListView : View {
    
    @ObservedObject var vm : DetailViewModel
    
    
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
            
            if vm.isLoading {
                
                VStack {
                    
                    Spacer()
                    
                    HStack(alignment: .center) {
                        
                        Spacer()
                        
                        ProgressView()
                            .progressViewStyle(.circular)
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                }
            }
            else {
                
                ScrollView {
                    
                    ForEach(vm.performanceList ?? [] , id: \.id) { item in
                        
                        ZStack {
                            
                            KFImage((item.artist != nil ? item.artist : item.venue)?.image,
                                    options: [.processor(DownsamplingImageProcessor(size: .init(width: 512, height: 512)))])
                            .resizable()
                            .aspectRatio(CGSize(width: 320, height: 150), contentMode: .fit)
                            .cornerRadius(8)
                            
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
//                                .background(Rectangle().foregroundColor(.clear).overlay(LinearGradient(
//                                    colors: [.black, .black, .clear],
//                                    startPoint: .bottom,
//                                    endPoint: .top))
//                                )
                                
                            }
                            
                        }
                        .overlay(RoundedCornerView(strokeColor: ColorReference.orange.color, strokeSize: 1, tl: 8, tr: 8, bl: 8, br: 8))
                        .padding(.vertical, 8)
                        
                    }
                }
                
            }
        }
        
    }
}
