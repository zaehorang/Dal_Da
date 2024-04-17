//
//  DateView.swift
//  Dal_Da
//
//  Created by zaehorang on 4/13/24.
//

import SwiftUI

struct DateView: View {
    
    // 현재 날짜를 저장하는 프로퍼티
    let currentDate = Date()
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: DateUtilities.moonPhaseSystemName(on: currentDate))
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.leading, 16)
            VStack(alignment: .leading, spacing: 2) {
                Text(DateUtilities.formatDateTime(currentDate, formatType: "MMM dd, yyyy"))
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                Text("\(DateUtilities.formatDateTime(currentDate, formatType: "EEEE")), \(DateUtilities.moonPhaseEnglishName(on: currentDate))")
                    .font(.system(size: 11, weight: .regular))
                    .foregroundColor(.white)

            }
            .padding(.vertical, 5)
            Spacer()
        }
        .background(Color.clear)

    }
}

#Preview {
    DateView()
}
