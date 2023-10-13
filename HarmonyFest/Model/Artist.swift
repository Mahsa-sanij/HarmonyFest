//
//  ArtistItemView.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation

protocol ArtistProtocol: Entity {
    
    var genre: String?      { get }

}

struct Artist: ArtistProtocol {
    
    var id: Int?
    var name: String?
    var genre: String?
    var image: URL? {
        let url = String(format: "https://songleap.s3.amazonaws.com/artists/%@.png", name?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")
        return URL(string: url)
    }

}
