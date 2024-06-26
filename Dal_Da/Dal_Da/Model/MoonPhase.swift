//
//  Moon.swift
//  Dal_Da
//
//  Created by zaehorang on 4/17/24.
//

import Foundation

enum MoonPhase: Int {
    case newMoon = 0, waxingCrescent, firstQuarter, waxingGibbous, fullMoon, waningGibbous, lastQuarter, waningCrescent

    var details: (englishName: String, koreanName: String, emoji: String) {
        switch self {
        case .newMoon:
            return ("New Moon", "신월", "🌑")
        case .waxingCrescent:
            return ("Waxing Crescent Moon", "초승달", "🌒")
        case .firstQuarter:
            return ("First Quarter Moon", "상현달", "🌓")
        case .waxingGibbous:
            return ("Waxing Gibbous Moon", "보름달이 되어가는 상현달", "🌔")
        case .fullMoon:
            return ("Full Moon", "보름달", "🌕")
        case .waningGibbous:
            return ("Waning Gibbous Moon", "보름달이 줄어드는 달", "🌖")
        case .lastQuarter:
            return ("Last Quarter Moon", "하현달", "🌗")
        case .waningCrescent:
            return ("Waning Crescent Moon", "그믐달", "🌘")
        }
    }

    // 현재 날짜에 맞는 달 모양 찾기
    static func currentPhase(on date: Date) -> MoonPhase {
        let lunarPhaseStart = Date("01/07/1970")
        let daysSinceStart = Calendar.current.dateComponents([.day], from: lunarPhaseStart, to: date).day!
        let seconds = daysSinceStart * 86400 + 12300
        let lunarMonths = seconds % 2551443
        let lunarMonthPart = lunarMonths / 637861
        let secondsSinceMainPhase = lunarMonths % 637861
        let index = 2 * lunarMonthPart + (86400 <= secondsSinceMainPhase ? 1 : 0)
        return MoonPhase(rawValue: index % 8)!
    }
}

