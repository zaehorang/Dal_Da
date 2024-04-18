//
//  Dal_DaApp.swift
//  Dal_Da
//
//  Created by zaehorang on 4/13/24.
//

import SwiftUI
import SwiftData
import TipKit

@main
struct Dal_DaApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Moon.self)
                .task {
//                    try? Tips.resetDatastore()
                    // Configure and load your tips at app launch.
                    try? Tips.configure([
                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
        
        
    }
}
