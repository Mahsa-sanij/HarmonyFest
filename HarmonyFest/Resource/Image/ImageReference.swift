//
//  ImageReference.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import SwiftUI

enum ImageReference: String {

    case banner  = "img_banner"
}

extension ImageReference {
    var image: Image {
        return Image(self.rawValue)
    }
}
