//
//  CameraView.swift
//  Dal_Da
//
//  Created by zaehorang on 4/14/24.
//

import SwiftUI

struct CameraView: View {
    @ObservedObject var viewModel = CameraViewModel()
    
    var body: some View {
        ZStack {
            viewModel.cameraPreview.ignoresSafeArea()
                .onAppear {
                    viewModel.configure()
                }
                .gesture(MagnificationGesture()  // zoom 기능, MagnificationGesture를 이용하여 핀치 제스처 이용
                    .onChanged { val in
                        viewModel.zoom(factor: val)
                    }
                    .onEnded { _ in
                        viewModel.zoomInitialize()
                    }
                         
                )
            
            
            VStack {
                HStack {
                    // 셔터사운드 온오프
                    Button(action: {viewModel.switchFlash()}) {
                        Image(systemName: viewModel.isFlashOn ?
                              "speaker.fill" : "speaker")
                        .foregroundColor(viewModel.isFlashOn ? .yellow : .white)
                    }
                    .padding(.horizontal, 30)
                    
                    // 플래시 온오프
                    Button(action: {viewModel.switchSilent()}) {
                        Image(systemName: viewModel.isSilentModeOn ?
                              "bolt.fill" : "bolt")
                        .foregroundColor(viewModel.isSilentModeOn ? .yellow : .white)
                    }
                    .padding(.horizontal, 30)
                }
                .font(.system(size:25))
                .padding()
                
                Spacer()
                
                HStack{
                    // 찍은 사진 미리보기
                    Button{
                        
                    } label: {
                        // view 추가
                        if let previewImage = viewModel.recentImage {
                            Image(uiImage: previewImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 75, height: 75)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .aspectRatio(1, contentMode: .fit)
                        } else {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 3)
                                .foregroundColor(.white)
                                .frame(width: 75, height: 75)
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    // 사진찍기 버튼
                    Button(action: {viewModel.capturePhoto()}) {
                        Circle()
                            .stroke(lineWidth: 5)
                            .frame(width: 75, height: 75)
                            .padding()
                    }
                    
                    Spacer()
                    
                    // 전후면 카메라 교체
                    Button(action: {viewModel.changeCamera()}) {
                        Image(systemName: "arrow.triangle.2.circlepath.camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        
                    }
                    .frame(width: 75, height: 75)
                    .padding()
                }
            }
            .foregroundColor(.white)
        }
        .opacity(viewModel.shutterEffect ? 0 : 1)  // 투명도 조절로 셔터가 깜빡이는 효과
    }
}



//struct CameraView: View {
//    @ObservedObject var viewModel = CameraViewModel()
//
//    var body: some View {
//        ZStack {
////            viewModel.cameraPreview.ignoresSafeArea()
////                .onAppear() {
////                    viewModel.configure()
////                }
//
//            VStack {
//                Spacer()
//
//                HStack {
//                    Image(systemName: "arrow.triangle.2.circlepath")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 50, height: 50)
//                    Spacer()
//
//
//
//
//                    Image(Asset.moonButton.fileName)
//                    Spacer()
//                    Image(systemName: "flashlight.on.circle")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 50, height: 50)
//
//                }
//                .padding()
//
//            }
//            .navigationTitle("Camera")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        print("Toolbar button pressed")
//                    }label: {
//                        Text("Timer")
//                            .foregroundStyle(.white)
//                    }
//                }
//            }
//            .toolbarBackground(Color.background, for: .navigationBar) //<- Set background
//            .toolbarBackground(.visible, for: .navigationBar) // <- Set visible
//        }
//    }
//}


#Preview {
    CameraView()
}
