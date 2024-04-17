//
//  ContentView.swift
//  Dal_Da
//
//  Created by zaehorang on 4/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isActive: Bool = false
    // MARK: - 🙋🏻 환경변수 추가
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        ZStack {
            if self.isActive {
                HomeView()
            } else {
                SplashView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
}
#Preview {
    ContentView()
}
