//
//  PokedexTableViewCell.swift
//  PokedexApi2
//
//  Created by Otávio da Silva on 25/11/22.
//

import UIKit

class PokedexTableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var namePokemon2: UILabel!
    @IBOutlet weak var pokemonImage2: UIImageView!
    @IBOutlet weak var namePokemon1: UILabel!
    @IBOutlet weak var pokemonImage1: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configPokedexCell(_ pokedex: [PokemonData]) {
        namePokemon1.text = pokedex[0].name
        pokemonImage1.setImage(urlAdress: pokedex[0].image)
        namePokemon2.text = pokedex[1].name
        pokemonImage2.setImage(urlAdress: pokedex[1].image)
        firstView.layer.cornerRadius = 20
        secondView.layer.cornerRadius = 20
    }
    
    
}
