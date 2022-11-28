//
//  PokeInfo.swift
//  PokedexApi2
//
//  Created by Otávio da Silva on 25/11/22.
//

import Foundation

struct PokemonData: Codable {
    var name: String
    var url: String
    var image: String {
        var imgUrl = "https:raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
        
        return imgUrl + getId() + ".png"
    }
    
    func getId() -> String {
    var id: String = ""
    var barNumber: Int = 0
    for letter in url.reversed() {
        if letter == "/" {
            barNumber += 1
        }
        if barNumber == 1 && letter != "/" {
            id += String(letter)
        }
        if barNumber == 2 {
            break
        }
    }
    return String(id.reversed())
}

}
enum codingKeys: CodingKey {
    case name, url
}
