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
    
    @State private var showingDeleteAlert = false
    @State private var showingSaveAlert = false
    
    @State private var activeAlert = false
    
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
                                activeAlert.toggle()
                                self.showingSaveAlert.toggle()
                                print("Save~~~~~~~~~~~")
                            } label: {
                                Label("Save", systemImage: "square.and.arrow.down")
                            }
                            
                            
                            
                            Divider()
                            
                            Button(role: .destructive) {
                                print("누ㅠㄹ림ㄴㅇㄹㅁ닝러ㅣ마넝ㄹ")
                                activeAlert.toggle()
                                self.showingDeleteAlert.toggle()
                                
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            
                        } label: {
                            Image("Three Dots")
                        }
                        .padding()
                        
                        .alert(isPresented: $activeAlert) {
                            
                            if showingDeleteAlert {
                                //                                showingDeleteAlert.toggle()
                                
                                Alert(title: Text("이미지 삭제"), message: Text("삭제된 이미지는 복구할 수 없습니다.\n정말로 삭제하시겠습니까?"), primaryButton: .destructive(Text("삭제"), action: {
                                    //some Action
                                    modelContext.delete(moon)
                                    
                                }), secondaryButton: .cancel(Text("취소"), action: {
                                    showingDeleteAlert.toggle()
                                }))
                                
                            } else {
                                //                                showingSaveAlert.toggle()
                                Alert(title: Text("이미지 저장"), message: Text("이 이미지를 사진 앨범에 저장하려고 합니다.\n저장하시겠습니까?"), primaryButton: .default(Text("저장"), action: {
                                    //some Action
                                    savePhoto(uiImage)
                                }), secondaryButton: .cancel(Text("취소"), action: {
                                    showingSaveAlert.toggle()
                                }))
                                
                            }
                            
                        }
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
                
                if let date = moon.date {  // moon에 날짜가 있으면
                    
                    Text(DateUtilities.formatDateTime(date, formatType: "MMM dd, yyyy"))
                        .font(.system(size: 36, weight: .medium))
                        .foregroundColor(.white)
                    
                    // 이미지 하단에 위치할 텍스트
                    VStack(alignment: .leading, spacing: 6) {
                        
                        Text("\(DateUtilities.formatDateTime(date, formatType: "EEEE"))\(moon.shape == "" ? "" : ", \(moon.shape)")")
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(.white)
                        
                        Text(moon.memo)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.gray100)
                        
                    }
                    
                    
                } else {  // 날짜가 없으면
                    
                    // 이미지 하단에 위치할 텍스트
                    VStack(alignment: .leading,spacing:4) {
                        Text(moon.shape)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.white)
                        
                        Text(moon.memo)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.white)
                        
                    }
                    
                    
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


