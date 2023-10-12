//
//  Performance.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation

struct Performance : Codable {
    
    var id: Int?
    var date: String?
    var genre: String?
    var entity: Entity?
    
    func getFormattedDate() -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let raw_date = formatter.date(from: self.date ?? "") {
            formatter.dateFormat = "EEEE, d MMM yyyy"
            return formatter.string(from: raw_date)
        }
        
        return ""
    }
    
    func getFormattedTime() -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let raw_date = formatter.date(from: self.date ?? "") {
            
            formatter.dateFormat = "h:mm a"
            return formatter.string(from: raw_date)
        }
        
        return ""
        
    }
}
