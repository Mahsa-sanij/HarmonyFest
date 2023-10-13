//
//  Performance.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation

protocol PerformanceProtocol: Codable {
    
    var id: Int?            {get}
    var date: String?       {get}
    var genre: String?      {get}
    var artist: Artist?     {get}
    var venue: Venue?       {get}
}

struct Performance: PerformanceProtocol {
    
    var id: Int?
    var date: String?
    var genre: String?
    var artist: Artist?
    var venue: Venue?
    
    
    private let originalDateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    private let targetDateFormat = "EEEE, d MMM yyyy"
    private let targetTimeFormat = "h:mm a"

    
    func getFormattedDate() -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = originalDateFormat
        if let raw_date = formatter.date(from: self.date ?? "") {
            formatter.dateFormat = targetDateFormat
            return formatter.string(from: raw_date)
        }
        
        return ""
    }
    
    func getFormattedTime() -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = originalDateFormat
        if let raw_date = formatter.date(from: self.date ?? "") {
            
            formatter.dateFormat = targetTimeFormat
            return formatter.string(from: raw_date)
        }
        
        return ""
        
    }
}
