//
//  HarmonyFestApp.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import SwiftUI

@main
struct HarmonyFestApp: App {
    
    let networkClient = NetworkClient()
    
    var body: some Scene {
        WindowGroup {
            MasterView(networkClient: networkClient)
        }
    }
}
