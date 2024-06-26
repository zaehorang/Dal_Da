//
//  SnapCarouselView.swift
//  Dal_Da
//
//  Created by zaehorang on 4/14/24.
//

import SwiftUI
import SwiftData

struct SnapCarouselView: View {
    // 현재 보여지고 있는 이미지의 인덱스를 관리하는 State 변수
    @State private var currentIndex: Int = 0
    // 드래그 제스처로 발생하는 수평 이동 거리를 추적하는 GestureState 변수
    @GestureState private var dragOffset: CGFloat = 0
    
    
    // 표시할 이미지 데이터 배열
    var moons: [Moon]
    
    var body: some View {
        // 네비게이션 스택을 사용하여 뷰를 구성
        NavigationStack {
            VStack {
                ZStack {
                    Image(Asset.background.fileName)
                        .resizable()
                        .ignoresSafeArea(.all)
                    
                    ForEach(Array(zip(moons.indices, moons)), id: \.0) { index, moon in
                        
                        MoonCardView(moon: moon)
                            .frame(width: 300, height: 500)  // 이미지 크기 지정
                            .cornerRadius(25)                // 이미지 모서리를 둥글게 처리
                        // 현재 인덱스의 이미지는 투명도 1.0, 나머지는 0.7로 설정하여 구분
                            .opacity(currentIndex == index ? 1.0 : 0.7)
                        // 현재 인덱스의 이미지는 크기를 1.2배로, 나머지는 0.8배로 설정
                            .scaleEffect(currentIndex == index ? 1.1 : 0.8)
                        // 이미지의 수평 위치를 currentIndex와 dragOffset에 따라 동적으로 조정
                            .offset(x: CGFloat(index - currentIndex) * 300 + dragOffset, y: 0)
                        
                    }
                }
            }
            // 드래그 제스처 추가
            .gesture(
                DragGesture()
                    .onEnded { value in
                        let threshold: CGFloat = 50  // 드래그 인식 임계값 설정
                        // 사용자가 오른쪽으로 충분히 드래그했는지 검사
                        if value.translation.width > threshold {
                            withAnimation {
                                // currentIndex를 하나 감소시켜 이전 이미지로 이동
                                currentIndex = max(0, currentIndex - 1)
                            }
                        } else if value.translation.width < -threshold {
                            withAnimation {
                                // currentIndex를 하나 증가시켜 다음 이미지로 이동
                                currentIndex = min(moons.count - 1, currentIndex + 1)
                            }
                        }
                    }
            )
        }
        .onAppear {
            currentIndex = 0  // 최근 사진부터 보여주기 위함
        }
    }
    
}



#Preview {

    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Moon.self, configurations: config)
    
    let moons = [Moon(date: .now, shape: "Full Moon", memo: "dddd", image: UIImage(named: "Moon3")!.pngData()!), Moon(date: .now, shape: "Full Moon", memo: "fqwef", image: UIImage(named: "Moon3")!.pngData()!),Moon(date: .now, shape: "Full Moon", memo: "fasdfqwef", image: UIImage(named: "Moon3")!.pngData()!),Moon(date: .now, shape: "Full Moon", memo: "dddd", image: UIImage(named: "Moon3")!.pngData()!),Moon(date: .now, shape: "Full Moon", memo: "ddddsaadfadf", image: UIImage(named: "Moon3")!.pngData()!)]

    return SnapCarouselView(moons: moons)
        
}
