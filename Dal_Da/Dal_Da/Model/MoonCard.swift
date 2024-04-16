//
//  Moon.swift
//  Dal_Da
//
//  Created by zaehorang on 4/14/24.
//


struct MoonCard: Identifiable, Hashable {
    var id: Int
    var date: String
    var shape: String
    var memo: String
    var image: String
}

extension MoonCard {
    static var previews: [MoonCard] = [
        MoonCard(id: 0, date: "Jul 23, 2024", shape: "Full Moon", memo: "주저리 주저리 주저리 주저리 주저리 주저리", image: "Moon1"),
        MoonCard(id: 1, date: "Jul 23, 2024", shape: "Full Moon", memo: "주저리 주저리 주저리 주저리주저리 주저리", image: "Moon2"),
        MoonCard(id: 2, date: "Jul 23, 2024", shape: "Full Moon", memo: "주저리 주저리 주저리 주저리주저리 주저리", image: "Moon3"),
        MoonCard(id: 3, date: "Jul 23, 2024", shape: "Full Moon", memo: "주저리 주저리 주저리 주저리주저리 주저리", image: "Moon1"),
        MoonCard(id: 4, date: "Jul 23, 2024", shape: "Full Moon", memo: "주저리 주저리 주저리 주저리주저리 주저리", image: "Moon2"),
        MoonCard(id: 5, date: "Jul 23, 2024", shape: "Full Moon", memo: "주저리 주저리 주저리 주저리주저리 주저리", image: "Moon3"),
        MoonCard(id: 6, date: "Jul 23, 2024", shape: "Full Moon", memo: "주저리 주저리 주저리 주저리주저리 주저리", image: "Moon1"),
        MoonCard(id: 7, date: "Jul 23, 2024", shape: "Full Moon", memo: "주저리 주저리 주저리 주저리주저리 주저리", image: "Moon2"),
        MoonCard(id: 8, date: "Jul 23, 2024", shape: "Full Moon", memo: "주저리 주저리 주저리 주저리주저리 주저리", image: "Moon3"),
    ]
}
