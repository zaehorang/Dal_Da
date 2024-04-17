//
//  SplashView.swift
//  Dal_Da
//
//  Created by zaehorang on 4/13/24.
//

import SwiftUI

struct SplashView: View {

    var body: some View {
        Image(Asset.splash.fileName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    SplashView()
}
