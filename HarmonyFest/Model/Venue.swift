//
//  Venue.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation

protocol VenueProtocol: Entity {
    
    var sortId: Int?    { get }
    
}

struct Venue: VenueProtocol {
    
    var id: Int?
    var name: String?
    var sortId: Int?
    var image: URL? {
        let url = String(format: "https://songleap.s3.amazonaws.com/venues/%@.png", name?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")
        return URL(string: url)
    }

}
