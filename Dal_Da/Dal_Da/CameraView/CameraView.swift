//
//  CameraView.swift
//  Dal_Da
//
//  Created by zaehorang on 4/14/24.
//

import SwiftUI

struct CameraView: View {
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel = CameraViewModel()
    
    var body: some View {
        
        VStack(spacing: 0) {  // default spacing이 있어서 0을 안주면 분리되어 보임
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
                    
                }
                .background(Color.background)
                
                Text("카메라")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                
            }
            
            viewModel.cameraPreview
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
                    
                    // 전후면 카메라 교체
                    Button {
                        viewModel.changeCamera()
                    } label: {
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 43, height: 43)
                            .tint(.white)
                    }
                    .padding(.horizontal, 30)
                    
                    
                    //                    // 찍은 사진 미리보기
                    //                    Button{
                    //
                    //                    } label: {
                    //                        // view 추가
                    //                        if let previewImage = viewModel.recentImage {
                    //                            Image(uiImage: previewImage)
                    //                                .resizable()
                    //                                .scaledToFill()
                    //                                .frame(width: 75, height: 75)
                    //                                .clipShape(RoundedRectangle(cornerRadius: 15))
                    //                                .aspectRatio(1, contentMode: .fit)
                    //                        } else {
                    //                            RoundedRectangle(cornerRadius: 15)
                    //                                .stroke(lineWidth: 3)
                    //                                .foregroundColor(.white)
                    //                                .frame(width: 75, height: 75)
                    //                        }
                    //                    }
                    //                    .padding()
                    
                    Spacer()
                    
//                    NavigationLink {
//                        ImageView(viewModel: viewModel, image: viewModel.recentImage)
//                    } label: {
//                        Button {
//                            viewModel.capturePhoto()
//
//                        } label: {
//                            Image(Asset.moonButton.fileName)
//                            
//                        }
//                    }
                    // 사진찍기 버튼
                    Button {
                        viewModel.capturePhoto()

                    } label: {
                        Image(Asset.moonButton.fileName)
                        
                    }
                    .fullScreenCover(isPresented: $viewModel.photoTaken) {
                        
                        ImageView(viewModel: viewModel, image: viewModel.recentImage)
                    }

                    
                    Spacer()
                    
                    // 플레시 온오프
                    Button {
                        viewModel.switchFlash()
                    } label: {
                        Image(systemName: viewModel.isFlashOn ?
                              "bolt.circle" : "bolt.slash.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 43, height: 43)
                        .tint(.white)
                    }
                    .padding(.horizontal, 30)
                    
                    
                }
                
//                HStack {
//                    Button {
//                        print("앨범으로 이도오오옹")
//                        
//                    } label: {
//                        Text("사진 앨범")
//                            .font(.system(size: 20, weight: .light))
//                            .foregroundColor(.gray100)
//                    }
//                    Spacer()
//                    
//                    Text("카메라")
//                        .font(.system(size: 20, weight: .medium))
//                        .foregroundColor(.white)
//                    
//                }
//                .padding(.horizontal, 30)
                
            }
            .background(Color.background)
        }
        .opacity(viewModel.shutterEffect ? 0 : 1)  // 투명도 조절로 셔터가 깜빡이는 효과
        .navigationBarHidden(true)
        
    }
}



#Preview {
    CameraView()
}
