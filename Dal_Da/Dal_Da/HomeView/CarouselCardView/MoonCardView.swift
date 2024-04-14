//
//  CarouselMoonView.swift
//  Dal_Da
//
//  Created by zaehorang on 4/14/24.
//

import SwiftUI


struct MoonCardView: View {
    var moon: Moon
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(moon.image)
                .resizable()
                .frame(width: 300, height: 500)
                .overlay( // 이 부분에서 그라디언트를 이미지 위에 추가
                    LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)// 그라디언트의 투명도 조절
                )
                .cornerRadius(24)
            
            
            VStack(alignment: .leading, spacing: 8) {
                // 이미지 중앙에 위치할 텍스트
                Text(moon.date)
                    .font(.system(size: 36, weight: .medium))
                    .foregroundColor(.white)
                
                // 이미지 하단에 위치할 텍스트
                VStack(alignment: .leading,spacing:4) {
                    Text(moon.shape)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.gray100)
                    
                    Text(moon.memo)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.gray100)
                    
                }
            }
            .padding(.leading, 24)
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    MoonCardView(moon: Moon.previews[1])
}
