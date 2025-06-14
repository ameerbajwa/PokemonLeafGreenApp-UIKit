//
//  ViewController.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/6/25.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    var titleLabel: UILabel!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callPokeAPINetworkServiceForBulbasaur()

        titleLabel = UILabel()
        titleLabel.text = "POKEMON LEAFGREEN APP"
        titleLabel.font = .systemFont(ofSize: 20.0)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        self.view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0)
        ])
    }

    func callPokeAPINetworkServiceForBulbasaur() {
        let decoder = JSONDecoder()
        let session = URLSession.shared
        let networkService = PokeAPINetworkService(session: session, decoder: decoder)
        let request = PokeAPIRequest<PokeAPIPokemonDetails>(baseUrl: .pokemonBaseUrl, endpoint: .pokemon, id: 1)
        
        Task {
            do {
                let response = try await networkService.callPokeAPIServer(with: request)
                print(response.id)
                print(response.name)
                for stat in response.stats {
                    print("\(stat.stat.name): \(stat.baseStat)")
                }
            } catch let error as PokemonLeafGreenError {
                print(error.debugDescription)
            }
        }
    }
}

