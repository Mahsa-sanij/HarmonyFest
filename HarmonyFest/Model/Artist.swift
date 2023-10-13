//
//  ArtistItemView.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation

class Artist : Entity {
    
    private enum CodingKeys: String, CodingKey
    {
        case genre
    }
    
    var genre: String?
    
    override var image: URL? {
        let url = String(format: "https://songleap.s3.amazonaws.com/artists/%@.png", name?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")
        return URL(string: url)
    }
    
    required init(from decoder: Decoder) throws {

        try super.init(from: decoder)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        genre = try values.decode(String.self, forKey: .genre)

    }
    
    
}
