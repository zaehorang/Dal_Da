//
//  Dal_DaApp.swift
//  Dal_Da
//
//  Created by zaehorang on 4/13/24.
//

import SwiftUI
import SwiftData

@main
struct Dal_DaApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Moon.self)
        }
        
    }
}
