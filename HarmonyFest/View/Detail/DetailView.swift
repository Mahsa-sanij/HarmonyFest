//
//  DetailView.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import SwiftUI
import struct Kingfisher.KFImage
import struct Kingfisher.DownsamplingImageProcessor


struct DetailView: View {
    
    @ObservedObject var vm : DetailViewModel

    let imageDownsampler = DownsamplingImageProcessor(size: .init(width: 256, height: 256))
        
    let artistItem: Artist?
    let venueItem: Venue?
    
    init(networkClient: NetworkProtocol, artistItem: Artist) {
        
        self.vm = .init(networkClient: networkClient)
        self.venueItem = nil
        self.artistItem = artistItem
    }
    
    init(networkClient: NetworkClient, venueItem: Venue) {
        
        self.vm = .init(networkClient: networkClient)
        self.artistItem = nil
        self.venueItem = venueItem
    }
    
    var body: some View {
        
        ZStack {
            
            ColorReference.primary.color.edgesIgnoringSafeArea(.all)
            
            
            VStack {
                
                ZStack(alignment: .bottom) {
                    
                    KFImage((artistItem != nil ? artistItem?.image : venueItem?.image),
                            options: [.processor(imageDownsampler)])
                    .resizable()
                    .aspectRatio(CGSize(width: 256, height: 150), contentMode: .fit)
                    .cornerRadius(8)
                    .overlay(RoundedCornerView(strokeColor: ColorReference.orange.color, strokeSize: 1, tl: 0, tr: 8, bl: 0, br: 8))
                    
                }
                .padding(.leading, -4)
                .padding(.trailing, 24)
                .padding(.bottom, 20)
                
                PerformanceListView(vm: vm)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 32)
                
            }
            .padding(.top, 20)
            .navigationBarTitle((artistItem != nil ? artistItem?.name : venueItem?.name) ?? "", displayMode: .large)
            
        }
        .onAppear{
            
            loadPerformanceData()
        }
        
        
    }
    
    private func loadPerformanceData() {
        
        if self.artistItem != nil {
            self.vm.getPerformances(artist: self.artistItem!)
        }
        else {
            self.vm.getPerformances(venue: self.venueItem!)
        }
        
    }
}



