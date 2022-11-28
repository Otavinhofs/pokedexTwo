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
extension UIImageView {
    func setImage(urlAdress: String) {
        guard let url = URL(string: urlAdress) else {return}
        
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: url)
            DispatchQueue.main.async { [weak self] in
                if let imageData = imageData {
                    if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                    }
                }
                
            }
//            DispatchQueue.main.async { [weak self] in
//                if let imageData = imageData {
//                    if let loadedImage = UIImage(data: imageData) {
//                        self?.image = loadedImage
//                    }
//                }
//
//            }
        }
    }

}
