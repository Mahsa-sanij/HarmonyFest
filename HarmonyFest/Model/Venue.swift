//
//  Venue.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation

class Venue : Entity {
    
    var sortId: Int?
    
    override var image: URL? {
        let url = String(format: "https://songleap.s3.amazonaws.com/venues/%@.png", name?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")
        return URL(string: url)
    }
}
