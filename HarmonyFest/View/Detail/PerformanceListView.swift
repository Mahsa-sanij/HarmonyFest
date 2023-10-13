//
//  PerformanceListView.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import SwiftUI


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
                
                CircularProgressView()
            }
            else {
                
                ScrollView {
                    
                    ForEach(vm.performanceList ?? [] , id: \.id) { item in
                        
                        PerformanceListItemView(item: item)
                    }
                }
                
            }
        }
        
    }
}
