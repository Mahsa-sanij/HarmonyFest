//
//  MockArtist.swift
//  HarmonyFestTests
//
//  Created by Mahsa Sanij on 10/13/23.
//

@testable import HarmonyFest
import Foundation

extension ArtistProtocol {
    
    static var artist1: Artist {
        return Artist(id: 1, name: "Shake The Disease", genre: "Synthpop")
    }
    
    static var artist2: Artist {
        return Artist(id: 2, name: "Kerouac Ginsburg", genre: "Folk")
    }
    
    static var artist3: Artist {
        return Artist(id: 3, name: "Diva Moon Rescue", genre: "Pop")
    }
    
    static var artist4: Artist {
        return Artist(id: 4, name: "Holy Shëët", genre: "Metal")
    }
    
    static var artist5: Artist {
        return Artist(id: 5, name: "Muddy Ray", genre: "Blues")
    }
    
}
