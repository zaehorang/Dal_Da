//
//  Moon.swift
//  Dal_Da
//
//  Created by zaehorang on 4/14/24.
//


struct Moon: Identifiable, Hashable {
    var id: Int
    var date: String
    var shape: String
    var memo: String
    var image: String
}

extension Moon {
    static var previews: [Moon] = [
        Moon(id: 0, date: "Jul 23, 2024", shape: "Full Moon", memo: "주저리 주저리 주저리 주저리 주저리 주저리", image: "Moon1"),
    Moon(id: 1, date: "Jul 23, 2024", shape: "Full Moon", memo: "주저리 주저리 주저리 주저리주저리 주저리", image: "Moon2"),
    Moon(id: 2, date: "Jul 23, 2024", shape: "Full Moon", memo: "주저리 주저리 주저리 주저리주저리 주저리", image: "Moon3"),
    Moon(id: 3, date: "Jul 23, 2024", shape: "Full Moon", memo: "주저리 주저리 주저리 주저리주저리 주저리", image: "Moon1"),
    Moon(id: 4, date: "Jul 23, 2024", shape: "Full Moon", memo: "주저리 주저리 주저리 주저리주저리 주저리", image: "Moon2"),
    Moon(id: 5, date: "Jul 23, 2024", shape: "Full Moon", memo: "주저리 주저리 주저리 주저리주저리 주저리", image: "Moon3"),
    Moon(id: 6, date: "Jul 23, 2024", shape: "Full Moon", memo: "주저리 주저리 주저리 주저리주저리 주저리", image: "Moon1"),
    Moon(id: 7, date: "Jul 23, 2024", shape: "Full Moon", memo: "주저리 주저리 주저리 주저리주저리 주저리", image: "Moon2"),
    Moon(id: 8, date: "Jul 23, 2024", shape: "Full Moon", memo: "주저리 주저리 주저리 주저리주저리 주저리", image: "Moon3"),
    ]
}
