//
//  ExtencionsController.swift
//  PokedexApi2
//
//  Created by Otávio da Silva on 25/11/22.
//

import UIKit

extension PokedexViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (pokedex?.results.count ?? 0) / 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var pokedex: [PokemonData] = []
        let pokeOne = self.pokedex!.results[indexPath.row * 2]
        let pokeTwo = self.pokedex!.results[(indexPath.row * 2) + 1]
        pokedex.append(pokeOne)
        pokedex.append(pokeTwo)
        let tapGesture1 = PokemonTapGesture.init(target: self, action: #selector(tapFirstImage))
        let tapGesture2 = PokemonTapGesture.init(target: self, action: #selector(tapFirstImage))
        let cell: PokedexTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokedexTableViewCell
        

        cell.secondView.addGestureRecognizer(tapGesture1)
        tapGesture1.addTarget(self, action: #selector(tapFirstImage))
        cell.firstView.addGestureRecognizer(tapGesture2)
        tapGesture2.addTarget(self, action: #selector(tapFirstImage))
        cell.configPokedexCell(pokedex)
        
        tapGesture1.name = pokeOne.name
        tapGesture1.idPokemon = pokeOne.getId()
        tapGesture1.pokemonImage = pokedex[0].image
        
        tapGesture2.name = pokeTwo.name
        tapGesture2.idPokemon = pokeTwo.getId()
        tapGesture2.pokemonImage = pokedex[1].image
        
        cell.configPokedexCell(pokedex)
        return cell
    }
}
class PokemonTapGesture: UITapGestureRecognizer {
    var namePokemon: String?
    var idPokemon: String?
    var pokemonImage: String?
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
