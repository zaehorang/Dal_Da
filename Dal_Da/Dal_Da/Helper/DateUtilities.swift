//
//  DateUtilities.swift
//  Dal_Da
//
//  Created by zaehorang on 4/17/24.
//

import Foundation

struct DateUtilities {
    static func formatDateTime(_ date: Date, formatType: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatType
        return dateFormatter.string(from: date)
    }

    static func moonPhaseEmoji(on date: Date) -> String {
        let phase = MoonPhase.currentPhase(on: date)
        return phase.details.emoji
    }
    
    static func moonPhaseKoreanName(on date: Date) -> String {
        let phase = MoonPhase.currentPhase(on: date)
        return phase.details.koreanName
    }
    
    static func moonPhaseEnglishName(on date: Date) -> String {
        let phase = MoonPhase.currentPhase(on: date)
        return phase.details.englishName
    }
    
}

extension Date {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()
    
    init(_ text: String) {
        self = Self.dateFormatter.date(from: text)!
    }
}
