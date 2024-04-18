//
//  Moon.swift
//  Dal_Da
//
//  Created by zaehorang on 4/14/24.
//

import Foundation
import SwiftData

@Model
final class Moon {
    var date: Date?
    var shape: String
    var memo: String
    var image: Data
    
    init(date: Date?, shape: String, memo: String, image: Data) {
        //        self.id = id
        self.date = date
        self.shape = shape
        self.memo = memo
        self.image = image
    }
    
}


extension Moon: Identifiable { }

extension Moon: Hashable {
    static func == (lhs: Moon, rhs: Moon) -> Bool {
        lhs.image == rhs.image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(date)
        hasher.combine(shape)
        hasher.combine(memo)
        hasher.combine(image)
    }
    
}
