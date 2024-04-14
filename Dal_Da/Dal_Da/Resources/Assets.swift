//
//  Assets.swift
//  Dal_Da
//
//  Created by zaehorang on 4/13/24.
//

enum Asset: String {
    case moonImage = "MoonImage"
    case background = "Background"
    case splash = "Splash"
    case moonButton = "MoonButton"

    var fileName: String {
        self.rawValue
    }
}
