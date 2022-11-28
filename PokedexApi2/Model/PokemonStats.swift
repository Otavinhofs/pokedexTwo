//
//  PokemonStats.swift
//  PokedexApi2
//
//  Created by Otávio da Silva on 28/11/22.
//

import Foundation

struct PokemonStats: Codable {
    var id: Int?
    var name: String
    var stats: [Statistic]?
}
