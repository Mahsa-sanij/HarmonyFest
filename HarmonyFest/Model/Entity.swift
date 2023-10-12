//
//  Entity.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation

class Entity : Codable {
    
    var id: Int?
    var name: String?
    var image: URL? {
        get {
            return nil
        }
    }
    
    init(id: Int? = nil, name: String? = nil) {
        self.id = id
        self.name = name
    }
    
}
