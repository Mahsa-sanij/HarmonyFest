//
//  Entity.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation

protocol Entity: Codable {
    
    var id: Int?        { get }
    var name: String?   { get }
    var image: URL?     { get }

}
