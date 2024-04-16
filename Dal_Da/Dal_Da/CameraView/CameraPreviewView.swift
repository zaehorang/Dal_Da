//
//  CameraPreviewView.swift
//  Dal_Da
//
//  Created by zaehorang on 4/15/24.
//

import SwiftUI
import AVFoundation

struct CameraPreviewView: UIViewRepresentable {
    
    class VideoPreviewView: UIView {
        override class var layerClass: AnyClass {
             AVCaptureVideoPreviewLayer.self
        }
        
        var videoPreviewLayer: AVCaptureVideoPreviewLayer {
            return layer as! AVCaptureVideoPreviewLayer
        }
    }
    
    let session: AVCaptureSession
    
    func makeUIView(context: Context) -> VideoPreviewView {
        let view = VideoPreviewView()
        
        // 기본 백그라운드 색을 지정
        view.backgroundColor = .black
        // 카메라 프리뷰 ratio 조절(fit, fill)
        view.videoPreviewLayer.videoGravity = .resizeAspectFill
        // 프리뷰 모서리에 corner radius를 결정
        view.videoPreviewLayer.cornerRadius = 0
        // 카메라 세션 지정(필수)
        view.videoPreviewLayer.session = session
//        view.videoPreviewLayer.connection?.videoOrientation = .portrait
        // 비디오 기본 방향 지정.
        view.videoPreviewLayer.connection?.videoRotationAngle = 90

        return view
    }
    
    func updateUIView(_ uiView: VideoPreviewView, context: Context) {
        
    }
}

