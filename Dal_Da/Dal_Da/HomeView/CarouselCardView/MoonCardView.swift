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
            if let uiImage = UIImage(data: moon.image) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 300, height: 500)
                    .overlay( // 이 부분에서 그라디언트를 이미지 위에 추가
                        LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)// 그라디언트의 투명도 조절
                    )
                    .cornerRadius(24)
                
            } else {
                Image("Moon1")
                    .resizable()
                    .frame(width: 300, height: 500)
                    .overlay( // 이 부분에서 그라디언트를 이미지 위에 추가
                        LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)// 그라디언트의 투명도 조절
                    )
                    .cornerRadius(24)
            }
            
            
            
            
            VStack(alignment: .leading, spacing: 8) {
                // 이미지 중앙에 위치할 텍스트
                Text(DateUtilities.formatDateTime(moon.date, formatType: "MMM dd, yyyy"))
                    .font(.system(size: 36, weight: .medium))
                    .foregroundColor(.white)
                
                // 이미지 하단에 위치할 텍스트
                VStack(alignment: .leading,spacing:4) {
                    //
                    Text("\(DateUtilities.formatDateTime(moon.date, formatType: "EEEE")), \(DateUtilities.moonPhaseEnglishName(on: moon.date))")
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
    MoonCardView(moon: Moon(date: Date(), shape: "Full Moon", memo: "주저리 주저리 주저리 주저리 주저리 주저리", image: UIImage(named: "Moon1")!.pngData()!))
}
