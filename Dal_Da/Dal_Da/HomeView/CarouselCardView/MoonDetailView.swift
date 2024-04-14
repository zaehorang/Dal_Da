//
//  MoonDetailView.swift
//  Dal_Da
//
//  Created by zaehorang on 4/14/24.
//

import SwiftUI

struct MoonDetailView: View {
    var moon: Moon
    
    var body: some View {
        Text("Details for \(moon.shape)")
            .font(.title)
            .padding()
    }
}

#Preview {
    MoonDetailView(moon: Moon.previews[1])
}
