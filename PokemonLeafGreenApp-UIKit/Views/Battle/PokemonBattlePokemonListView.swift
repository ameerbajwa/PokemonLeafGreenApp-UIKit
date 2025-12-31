//
//  PokemonBattlePokemonListView.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/28/25.
//

import Foundation
import UIKit
import Combine

class PokemonBattlePokemonListView: UIView {    
    var pokemonListView: UIView!
    var pokemonListTableView: UITableView!
    
    func setupMoveListView() {
        pokemonListView = UIView()
        pokemonListView.layer.cornerRadius = 5
        pokemonListView.layer.borderWidth = 5
        pokemonListView.layer.borderColor = UIColor.black.cgColor
        
        pokemonListTableView = UITableView()
        pokemonListTableView.dataSource = self
        pokemonListTableView.delegate = self
        pokemonListTableView.register(PokemonBattlePokemonListCellView.self, forCellReuseIdentifier: PokemonBattlePokemonListCellView.identifier)
        
        self.addSubview(pokemonListView)
        pokemonListView.addSubview(pokemonListTableView)
        pokemonListView.translatesAutoresizingMaskIntoConstraints = false
        pokemonListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pokemonListView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            pokemonListView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            pokemonListView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0),
            pokemonListView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0),
            
            pokemonListTableView.topAnchor.constraint(equalTo: pokemonListView.topAnchor, constant: 10.0),
            pokemonListTableView.leadingAnchor.constraint(equalTo: pokemonListView.leadingAnchor, constant: 10.0),
            pokemonListTableView.trailingAnchor.constraint(equalTo: pokemonListView.trailingAnchor, constant: -10.0),
            pokemonListTableView.bottomAnchor.constraint(equalTo: pokemonListView.bottomAnchor, constant: -10.0)
        ])
    }
}

extension PokemonBattlePokemonListView: UITableViewDelegate {
    
}

extension PokemonBattlePokemonListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonBattlePokemonListCellView.identifier, for: indexPath) as? PokemonBattlePokemonListCellView else {
            return UITableViewCell()
        }
        
        
        return cell
    }
}
