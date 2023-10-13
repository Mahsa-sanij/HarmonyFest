//
//  Array.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/13/23.
//

import Foundation

extension Array where Element == Artist {
    
    var sorted : Array {
        return self.sorted(by: {
            $0.name ?? "" < $1.name ?? ""
        })
    }
    
}

extension Array where Element == Venue {
    
    var sorted : Array {
        return self.sorted(by: {
            $0.sortId ?? 0 < $1.sortId ?? 0
        })
    }
}

extension Array where Element: PerformanceProtocol {
    
    var sorted : Array {
        return self.sorted(by: {
            $0.date ?? "" < $1.date ?? ""
        })
    }
    
}
