//
//  Moon.swift
//  Dal_Da
//
//  Created by zaehorang on 4/17/24.
//

import Foundation

enum MoonPhase: Int {
    case newMoon = 0, waxingCrescent, firstQuarter, waxingGibbous, fullMoon, waningGibbous, lastQuarter, waningCrescent

    var details: (systemName: String, englishName: String, koreanName: String, emoji: String) {
        switch self {
        case .newMoon:
            return ("moonphase.new.moon", "New Moon", "신월", "🌑")
        case .waxingCrescent:
            return ("moonphase.waxing.crescent", "Waxing Crescent Moon", "초승달", "🌒")
        case .firstQuarter:
            return ("moonphase.first.quarter", "First Quarter Moon", "상현달", "🌓")
        case .waxingGibbous:
            return ("moonphase.waxing.gibbous", "Waxing Gibbous Moon", "보름달이 되어가는 상현달", "🌔")
        case .fullMoon:
            return ("moonphase.full.moon", "Full Moon", "보름달", "🌕")
        case .waningGibbous:
            return ("moonphase.waning.gibbous", "Waning Gibbous Moon", "보름달이 줄어드는 달", "🌖")
        case .lastQuarter:
            return ("moonphase.last.quarter", "Last Quarter Moon", "하현달", "🌗")
        case .waningCrescent:
            return ("moonphase.waning.crescent", "Waning Crescent Moon", "그믐달", "🌘")
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

