//
//  StatisticViewController.swift
//  PokedexApi2
//
//  Created by Otávio da Silva on 28/11/22.
//

import UIKit

class StatisticViewController: UIViewController {
    @IBOutlet weak var namePokemon: UILabel!
    
    @IBOutlet weak var pokeDefence: UILabel!
    @IBOutlet weak var pokeAtack: UILabel!
    @IBOutlet weak var pokeHealth: UILabel!
    @IBOutlet weak var downView: UIView!
    @IBOutlet weak var pokeSpeed: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!
    var pokemon: PokemonStats?
    var pokeid: String!
    var imageId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downView.layer.cornerRadius = 30
        getStats()
    }
    func getStats() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokeid ?? "")")
        if let url = url {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("aplication.json", forHTTPHeaderField: "Content-Type")
            let session = URLSession.shared
            let task = session.dataTask(with: request) { data, response, error in
                
                if let data = data, error == nil {
                    do {
                        let decoder = JSONDecoder()
                        let pokeStats = try decoder.decode(PokemonStats.self, from: data)
                        self.pokemon = pokeStats
                        print(pokeStats)
                        DispatchQueue.main.async {
                            self.namePokemon.text = pokeStats.name.capitalized
                            self.pokeHealth.text = String(pokeStats.stats![0].baseStat)
                            self.pokeAtack.text = String(pokeStats.stats![1].baseStat)
                            self.pokeDefence.text = String(pokeStats.stats![2].baseStat)
                            self.pokeSpeed.text = String(pokeStats.stats![5].baseStat)
                            
                        }
                        
                    } catch let error{
                        print(error)
                    }
                }
            }
            task.resume()
        }
        
    }


}
