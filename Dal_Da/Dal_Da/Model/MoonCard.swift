//
//  Moon.swift
//  Dal_Da
//
//  Created by zaehorang on 4/14/24.
//

import Foundation
import SwiftData

@Model
final class MoonCard {
    var date: Date
    var shape: MoonPhase
    var memo: String
    var image: Data
    
    init(date: Date = .now, shape: MoonPhase, memo: String, image: Data) {
        //        self.id = id
        self.date = date
        self.shape = shape
        self.memo = memo
        self.image = image
    }
    
}


extension MoonCard: Identifiable { }

extension MoonCard: Hashable {
    static func == (lhs: MoonCard, rhs: MoonCard) -> Bool {
        lhs.image == rhs.image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(date)
        hasher.combine(shape)
        hasher.combine(memo)
        hasher.combine(image)
    }
    
}
