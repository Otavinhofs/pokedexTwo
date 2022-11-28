//
//  Stats.swift
//  PokedexApi2
//
//  Created by Otávio da Silva on 28/11/22.
//

import Foundation

struct Statistic: Codable {
    var baseStat: Int
    var stat: StatisticData
    
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }
}
