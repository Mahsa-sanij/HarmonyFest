//
//  ArtistItemView.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation

struct Artist : Codable {
    
    var id: Int?
    var name: String?
    var genre: String?
    
    var image: URL? {
        let url = String(format: "https://songleap.s3.amazonaws.com/artists/%@.png", name?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")
        print(url)
        return URL(string: url)
    }
}
