//
//  HomeView.swift
//  Dal_Da
//
//  Created by zaehorang on 4/13/24.
//

import SwiftUI

struct HomeView: View {
    
    // 표시할 이미지 데이터 배열
    @State private var moons: [MoonCard] = [
        MoonCard(date: Date(), shape: .fullMoon, memo: "주저리 주저리 주저리 주저리 주저리 주저리", image: UIImage(named: "Moon1")!.pngData()!),
        MoonCard(date: Date(), shape: .fullMoon, memo: "주저리 주저리 주저리 주저리주저리 주저리", image: UIImage(named: "Moon2")!.pngData()!),
        MoonCard(date: Date(), shape: .fullMoon, memo: "주저리 주저리 주저리 주저리주저리 주저리", image: UIImage(named: "Moon3")!.pngData()!),
    ]
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .top) {
                
                SnapCarouselView(moons: $moons)
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

