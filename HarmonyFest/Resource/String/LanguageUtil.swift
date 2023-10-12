//
//  LanguageUtil.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation

internal class LangUtil: NSObject {
    
    static var lang: String = "Base"
    
    static func changeLanguage(newLang: String) {
        UserDefaults.standard.setValue(newLang, forKey: "selectedLanguage")
        UserDefaults.standard.synchronize()
        
        lang = newLang
    }
    
    static func loadLanguage() {
        let targetLang = UserDefaults.standard.object(forKey: "selectedLanguage") as? String
        lang = targetLang ?? "Base"
    }
}
