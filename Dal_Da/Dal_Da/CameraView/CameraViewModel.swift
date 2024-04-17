//
//  CameraViewModel.swift
//  Dal_Da
//
//  Created by zaehorang on 4/15/24.
//

import AVFoundation
import Combine
import SwiftUI

class CameraViewModel: ObservableObject {
    private let model: Camera
    private let session: AVCaptureSession
    private var isCameraBusy = false
    private var subscriptions = Set<AnyCancellable>()  // combine
    
    // 줌기능
    var currentZoomFactor: CGFloat = 1.0
    var lastScale: CGFloat = 1.0
    
    let cameraPreview: AnyView
    let hapticImpact = UIImpactFeedbackGenerator()  // 햅틱 반응
    
    @Published var shutterEffect = false  // 화면 깜빡임
    @Published var recentImage: UIImage?   // combine
    @Published var photoTaken = false
    @Published var isFlashOn = false
    @Published var isSilentModeOn = false
    
    func configure() {
        model.requestAndCheckPermissions()
    }
    
    func switchFlash() {
        isFlashOn.toggle()
        model.flashMode = isFlashOn == true ? .on : .off
    }
    
    func switchSilent() {
        isSilentModeOn.toggle()
    }
    
    // 사진찍기 메서드
    func capturePhoto() {
        if isCameraBusy == false {
            hapticImpact.impactOccurred()
            withAnimation(.easeInOut(duration: 0.1)) {
                shutterEffect = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.easeInOut(duration: 0.1)) {
                    self.shutterEffect = false
                }
            }
            model.capturePhoto()
            print("[CameraViewModel]: Photo captured!")
        } else {
            print("[CameraViewModel]: Camera's busy.")
        }
    }
    
    func savePhoto(_ image: UIImage?) {
        guard let image = image else { return }
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        // 사진 저장하기
        print("[Camera]: Photo's saved")
    }
    
    func zoom(factor: CGFloat) {  // Camera의 onChange에서 호출하는 줌 기능
        let delta = factor / lastScale
        lastScale = factor
        
        let newScale = min(max(currentZoomFactor * delta, 1), 5)
        model.zoom(newScale)
        currentZoomFactor = newScale
    }
    
    func zoomInitialize() {  // Camera의 onEnded에서 호출하는 줌 기능
        lastScale = 1.0
    }
    
    // 전/후면 카메라 전환
    func changeCamera() {
        model.changeCamera()
        print("[CameraViewModel]: Camera changed!")
    }
    
    //MARK: - init 메서드
    init() {
        model = Camera()
        session = model.session
        cameraPreview = AnyView(CameraPreviewView(session: session))
        
        // combine
        // model의 recentImage가 optional
        model.$recentImage.sink { [weak self] (photo) in
            guard let pic = photo else { return }
            self?.recentImage = pic  // 이미지 저장
            self?.photoTaken = true  // 저장을 알림
        }
        .store(in: &self.subscriptions)
        
        // 촬영 중 다른 버튼 Lock
        model.$isCameraBusy.sink { [weak self] (result) in
            self?.isCameraBusy = result
        }
        .store(in: &self.subscriptions)
    }
}
