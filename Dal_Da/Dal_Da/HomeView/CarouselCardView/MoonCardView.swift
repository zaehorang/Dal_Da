//
//  CarouselMoonView.swift
//  Dal_Da
//
//  Created by zaehorang on 4/14/24.
//

import SwiftUI
import SwiftData


struct MoonCardView: View {
    @Environment(\.modelContext) private var modelContext
    
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
                    .overlay(alignment: .topTrailing) {
                        
                        Menu {
                            
                            Button {
                                savePhoto(uiImage)
                                print("Save~~~~~~~~~~~")
                            } label: {
                                Label("Save", systemImage: "square.and.arrow.down")
                            }

                            
                            Divider()
                            
                            Button(role: .destructive) {
                                modelContext.delete(moon)
                                print("Delete~~~~~~~~~~~~~")
                                
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            
                        } label: {
                            Image("Three Dots")
                        }
                        .padding()
                        
                        
                    }
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
    
    func savePhoto(_ image: UIImage?) {
        guard let image = image else { return }
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        // 사진 저장하기
        print("[Camera]: Photo's saved")
    }

    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Moon.self, configurations: config)
    
    let moon1 = Moon(date: .now, shape: "Full Moon", memo: "dddd", image: UIImage(named: "Moon3")!.pngData()!)
    
    return MoonCardView(moon: moon1)
}
