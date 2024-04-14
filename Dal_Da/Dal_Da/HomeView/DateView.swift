//
//  DateView.swift
//  Dal_Da
//
//  Created by zaehorang on 4/13/24.
//

import SwiftUI

struct DateView: View {
    var moonName = "Full Moon"
    
    var body: some View {
        HStack(spacing: 16) {
            Image(Asset.moonImage.fileName)
                .padding(.leading, 16)
            VStack(alignment: .leading, spacing: 2) {
                Text("JUL 23, 2024")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                Text("Sunday, \(moonName)")
                    .font(.system(size: 11, weight: .regular))
                    .foregroundColor(.white)

            }
            .padding(.vertical, 5)
            Spacer()
        }
        .background(Color.background)

    }
}

#Preview {
    DateView()
}
