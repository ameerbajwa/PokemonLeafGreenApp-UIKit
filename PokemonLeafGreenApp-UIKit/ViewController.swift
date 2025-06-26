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
    var printButton: UIButton!
    
    var coreDataNetworkService: CoreDataNetworkService
    
    init() {
        coreDataNetworkService = CoreDataNetworkService(container: AppDelegate().persistentContainer)
        
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
        
        printButton = UIButton()
        printButton.setTitle("Print from CoreData", for: .normal)
        printButton.titleLabel?.font = .boldSystemFont(ofSize: 16.0)
        printButton.layer.borderWidth = 5.0
        printButton.layer.borderColor = UIColor.black.cgColor
        printButton.addTarget(self, action: #selector(printCoreDataObject), for: .touchUpInside)
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(printButton)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        printButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0),
            
            printButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            printButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30.0),
        ])
    }

    func callPokeAPINetworkServiceForBulbasaur() {
        let decoder = JSONDecoder()
        let session = URLSession.shared
        let pokeAPINetworkService = PokeAPINetworkService(session: session, decoder: decoder)
        let pokemonRequest = PokeAPIRequest<PokeAPIPokemonDetails>(baseUrl: .pokemonBaseUrl, endpoint: .pokemon, id: 1)
        let pokemonSpeciesRequest = PokeAPIRequest<PokeAPIPokemonSpeciesDetails>(baseUrl: .pokemonBaseUrl, endpoint: .species, id: 1)
        
        Task {
            do {
                let pokemonResponse = try await pokeAPINetworkService.callPokeAPIServer(with: pokemonRequest)
                let pokemonSpeciesResponse = try await pokeAPINetworkService.callPokeAPIServer(with: pokemonSpeciesRequest)
                try coreDataNetworkService.saveCoreDataPokemonModel(pokeAPIPokemon: pokemonResponse, pokeAPIPokemonSpecies: pokemonSpeciesResponse)
            } catch let error as PokemonLeafGreenError {
                print(error.debugDescription)
                print(error.errorLogDescription)
            }
        }
    }
    
    @objc
    func printCoreDataObject(sender: UIButton) {
        do {
            let coreDataPokemonModel = try coreDataNetworkService.fetchCoreDataPokemonDetails(pokemonName: "bulbasaur")
            guard let safeCoreDataPokemonModel = coreDataPokemonModel else {
                print("could not unwrap optional coredata model")
                return
            }
            
            print("Id: \(safeCoreDataPokemonModel.id)")
            print("Pokemon: \(safeCoreDataPokemonModel.name)")
            print("Base Experience: \(safeCoreDataPokemonModel.baseExperience)")
            print("Growth Rate: \(safeCoreDataPokemonModel.growthRate)")
            print("Type: \(safeCoreDataPokemonModel.type)")
            print("Description: \(safeCoreDataPokemonModel.pokemonDescription)")
            print("\n")
            print("Stats")
            for stat in safeCoreDataPokemonModel.stats {
                guard let pokemonStat = stat as? CoreDataPokemonStat else {
                    print("could not convert NSSet to CoreDataPokemonStat")
                    return
                }
                print(pokemonStat.name)
                print(" - Base Value: \(pokemonStat.baseValue)")
                print(" - Individual Value: \(pokemonStat.individualValue)")
                print(" - Effort Value: \(pokemonStat.effortValue)")
            }

            print("\nMoves")
            for move in safeCoreDataPokemonModel.moves {
                guard let pokemonMove = move as? CoreDataPokemonMoveList else {
                    print("could not convert NSSet to CoreDataPokemonMoveList")
                    return
                }
                
                print("\(pokemonMove.name) - \(pokemonMove.id)")
                print(" - Level Learned At: \(pokemonMove.levelLearnedAt)")
            }
        } catch let error as PokemonLeafGreenError {
            print(error.debugDescription)
            print(error.errorLogDescription)
        } catch {
            print(error.localizedDescription)
        }
    }
}

