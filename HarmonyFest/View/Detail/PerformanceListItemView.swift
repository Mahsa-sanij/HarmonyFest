//
//  PerformanceListItem.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/13/23.
//

import SwiftUI
import struct Kingfisher.KFImage
import struct Kingfisher.DownsamplingImageProcessor


struct PerformanceListItemView: View {
    
    let item: Performance
    let imageDownSampler = DownsamplingImageProcessor(size: .init(width: 512, height: 512))
    
    var body: some View {
        
        ZStack {
            
            KFImage((item.artist != nil ? item.artist?.image : item.venue?.image),
                    options: [.processor(imageDownSampler)])
            .resizable()
            .aspectRatio(CGSize(width: 320, height: 150), contentMode: .fit)
            .cornerRadius(8)
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 4) {
                    
                    HStack {
                        Text((item.artist != nil ? item.artist?.name : item.venue?.name) ?? "")
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
