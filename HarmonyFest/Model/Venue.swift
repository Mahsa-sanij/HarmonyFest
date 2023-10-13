//
//  Venue.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation

class Venue : Entity {
    
    
    private enum CodingKeys: String, CodingKey
    {
        case sortId
    }
    
    var sortId: Int?
    
    override var image: URL? {
        let url = String(format: "https://songleap.s3.amazonaws.com/venues/%@.png", name?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")
        return URL(string: url)
    }
    
    
    required init(from decoder: Decoder) throws {

        try super.init(from: decoder)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        sortId = try values.decode(Int.self, forKey: .sortId)

    }
}
