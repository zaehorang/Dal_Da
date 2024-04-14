//
//  HomeView.swift
//  Dal_Da
//
//  Created by zaehorang on 4/13/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
            ZStack(alignment: .top) {
                
                SnapCarouselView()
                DateView()
                
            }
            .overlay(alignment: .bottom) {
                Button {
                        
                } label: {
                    Image(Asset.moonButton.fileName)

                }
            }
    }
}

#Preview {
    HomeView()
}
