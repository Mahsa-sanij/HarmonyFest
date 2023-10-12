//
//  ArtistItemView.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation

class Artist : Entity {
    
    var genre: String?
    
    override var image: URL? {
        let url = String(format: "https://songleap.s3.amazonaws.com/artists/%@.png", name?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")
        return URL(string: url)
    }
    
}
