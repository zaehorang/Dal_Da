//
//  HomeView.swift
//  Dal_Da
//
//  Created by zaehorang on 4/13/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Query var moons: [Moon]
    
    private let moonButtonTip = MoonButtonTip()
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .top) {
                
                SnapCarouselView(moons: moons.reversed())
                
                DateView()
                
            }
            .overlay(alignment: .bottom) {
                
                NavigationLink {
                    CameraView()
                } label: {
                    Image(Asset.moonButton.fileName)
                }
                .popoverTip(moonButtonTip)
                //                .tipBackground(.black)
                
            }
        }
        .tint(.white)  // 백 버튼 컬러 수정
    }

}


#Preview {
    HomeView()
}

