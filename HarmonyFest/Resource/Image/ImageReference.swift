//
//  ImageReference.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import SwiftUI

enum ImageReference: String {

    case placeholder  = "placeholder"
}

extension ImageReference {
    var image: Image {
        return Image(self.rawValue)
    }
}
