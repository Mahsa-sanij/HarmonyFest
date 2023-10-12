//
//  Result.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation

public class Result<T : Decodable> : Decodable {
    
    var status: Int = 0
    var data : [T]?
    var errorDescription : String?
    
    required init(status : Int) {
        
        self.status = status
    }
}
