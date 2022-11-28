//
//  ViewController.swift
//  PokedexApi2
//
//  Created by Otávio da Silva on 25/11/22.
//

import UIKit

class PokedexViewController: UIViewController {

    @IBOutlet weak var pokemonTableView: UITableView!
    
    var pokedex: Pokedex?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPokemons()
        self.pokemonTableView.dataSource = self
        self.title = "pokedex"

    }
    func getPokemons() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100")
        if let url = url {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("aplication.json", forHTTPHeaderField: "Content-Type")
            let session = URLSession.shared
            let task = session.dataTask(with: request) { data, response, error in
                
                if let data = data, error == nil {
                    do {
                        let decoder = JSONDecoder()
                        let pokedex = try decoder.decode(Pokedex.self, from: data)
                        self.pokedex = pokedex
                        print(pokedex)
                        DispatchQueue.main.async {
                            self.pokemonTableView.reloadData()
                        }
                        
                    } catch let error{
                        print(error)
                    }
                }
            }
            task.resume()
        }
        
    }
    @IBAction func tapFirstImage(_ sender: PokemonTapGesture) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "StatisticScreen", bundle: nil)
        let stactistViewScreen = storyBoard.instantiateViewController(withIdentifier: "SecondScreen") as! StatisticViewController
        stactistViewScreen.pokeid = sender.idPokemon
        stactistViewScreen.imageId = sender.pokemonImage
        self.navigationController?.pushViewController(stactistViewScreen, animated: true)
    }
    
}
