//
//  MasterItemView.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import SwiftUI
import struct Kingfisher.KFImage
import struct Kingfisher.DownsamplingImageProcessor

struct MasterItemView : View {
    
    let item : Entity
    
    var body: some View
    {
        HStack(spacing: 12) {
            
            KFImage(item.image,
                    options: [.processor(DownsamplingImageProcessor(size: .init(width: 256, height: 256)))])
                .placeholder({
                    ImageReference.placeholder.image
                })
                .resizable()
                .frame(width: 64, height: 64)
                .cornerRadius(4)
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text(item.name ?? "")
                    .font(Font.system(size: 18, weight: .medium, design: .default))
                
                if let artist = item as? Artist {
                    
                    Text(artist.genre ?? "")
                        .font(Font.system(size: 16, weight: .regular, design: .default))
                    
                }
                
            }
            .padding(.vertical, 8)
            
            Spacer()
            
        }
        .padding(.all, 8)
    }
    
}
