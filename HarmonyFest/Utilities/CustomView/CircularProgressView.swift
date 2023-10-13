//
//  CircularProgressView.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/13/23.
//

import SwiftUI

struct CircularProgressView: View {
    var body: some View {
        
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
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView()
    }
}
