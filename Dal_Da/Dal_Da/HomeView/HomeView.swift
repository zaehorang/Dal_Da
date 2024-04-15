//
//  HomeView.swift
//  Dal_Da
//
//  Created by zaehorang on 4/13/24.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .top) {
                
                SnapCarouselView()
                DateView()
                
            }
            .overlay(alignment: .bottom) {
                
                NavigationLink {
                    CameraView()
                } label: {
                    Image(Asset.moonButton.fileName)
                }
                
            }
        }
        .tint(.white)  // 백 버튼 컬러 수정
    }
}

#Preview {
    HomeView()
}

