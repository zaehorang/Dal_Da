//
//  MoonDetailView.swift
//  Dal_Da
//
//  Created by zaehorang on 4/14/24.
//

import SwiftUI

struct MoonDetailView: View {
    var moon: MoonCard
    
    var body: some View {
        Text("Details for \(moon.shape.details.englishName)")
            .font(.title)
            .padding()
    }
}

#Preview {
    MoonDetailView(moon: MoonCard.previews[1])
}
