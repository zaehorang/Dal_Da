//
//  ImageView.swift
//  Dal_Da
//
//  Created by zaehorang on 4/16/24.
//

import SwiftUI


struct ImageView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: CameraViewModel
    
    @State private var memo = ""
    @State private var showDate = true
    @State private var showMoobShape = true
    
    @Binding var isDismiss: Bool
    
    // 현재 날짜를 저장하는 프로퍼티
    let currentDate = Date()
    
    var image: UIImage?
    
    var body: some View {
        
        VStack(spacing: 0) {
            ZStack {
                
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .tint(.white)
                        
                    }
                    .padding()
                    
                    Spacer()
                    Spacer()
                    
                    Button {
                        isDismiss = true
                        viewModel.savePhoto(image)
                        dismiss()  // 이미지 뷰만 내려감
                    } label: {
                        Text("저장")
                            .font(.system(size: 15, weight: .light))
                            .foregroundColor(.white)
                    }
                    .padding()
                    
                }
                .background(Color.background)
                
                Text("이미지")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                
                
            }
            
            
            ZStack(alignment: .bottomLeading) {
                
                if let image {
                    
                    Image(uiImage: image)
                        .resizable()
                        .overlay( // 이 부분에서 그라디언트를 이미지 위에 추가
                            LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.3)]), startPoint: .center, endPoint: .bottom)// 그라디언트의 투명도 조절
                        )
                } else {
                    Image("Moon3")
                        .resizable()
                        .overlay( // 이 부분에서 그라디언트를 이미지 위에 추가
                            LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.3)]), startPoint: .center, endPoint: .bottom)// 그라디언트의 투명도 조절
                        )
                    
                }
                
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(DateUtilities.formatDateTime(currentDate, formatType: "MMM dd, yyyy")) // 날짜
                        .font(.system(size: 36, weight: .medium))
                        .foregroundColor(.white)
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(DateUtilities.formatDateTime(currentDate, formatType: "EEEE")), \(DateUtilities.moonPhaseEnglishName(on: currentDate))")  // 요일
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.white)
                        
                        Text(memo)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
            }
            
            ImageInfoView(memo: $memo, showDate: $showDate, showMoobShape: $showMoobShape)
            
        }
    }
    
}


//#Preview {
//    let viewModel = CameraViewModel()
//    
//    ImageView(viewModel: viewModel)
//}


