//
//  ImageInfoView.swift
//  Dal_Da
//
//  Created by zaehorang on 4/16/24.
//

import SwiftUI

struct ImageInfoView: View {
    
    @Binding var memo: String
    @Binding var showDate: Bool
    @Binding var showMoobShape: Bool
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                
                Text("memo")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.white)
                
                TextField("Memo", text: $memo)
                    .padding()
                    .frame(height: 34)
                    .background(.blueGray)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .font(.system(size: 17, weight: .light))
            }
            
            Divider()
                .background(Color.blueGray)
            
            Toggle(isOn: $showDate, label: {
                Text("Date")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.white)
            })
            .toggleStyle(SwitchToggleStyle(tint: Color.blue100))
            
            Divider()
                .background(Color.blueGray)
            
            Toggle(isOn: $showMoobShape, label: {
                Text("Moon Shape")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.white)
            })
            .toggleStyle(SwitchToggleStyle(tint: Color.blue100))
            
        }
        .padding()
        .background(Color.background)
    }
}

 
#Preview {
    ImageInfoView(memo: .constant("일이삼사오육칠팔구십일이삼사오육칠팔"), showDate: .constant(true), showMoobShape: .constant(true))
}
