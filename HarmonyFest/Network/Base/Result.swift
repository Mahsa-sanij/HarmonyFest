//
//  Result.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation

enum Status {
    
    case Success
    case Failure
}

public class Result<T : Decodable> : Error {
    
    var status: Status = .Success
    var data : [T]?
    var errorDescription : String?
    
    required init(status : Status, errorDescription: String?, data: [T]?) {
        
        self.status = status
        self.errorDescription = errorDescription
        self.data = data
    }
}
