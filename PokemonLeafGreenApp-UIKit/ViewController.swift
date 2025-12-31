////
////  ViewController.swift
////  PokemonLeafGreenApp-UIKit
////
////  Created by Ameer Bajwa on 6/6/25.
////
//
//import Foundation
//import UIKit
//
//class ViewController: UIViewController {
//    var titleLabel: UILabel!
//    var printButton: UIButton!
//    
//    var pokeAPINetworkService: PokeAPINetworkService
//    var coreDataNetworkService: CoreDataNetworkService
//    
//    private var animationTimer: Timer?
//    
//    init(pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService) {
//        self.pokeAPINetworkService = pokeAPINetworkService
//        self.coreDataNetworkService = coreDataNetworkService
//        
//        super.init(nibName: nil, bundle: nil)
//        self.view.backgroundColor = .white
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
////        callPokeAPINetworkServiceForBulbasaur()
//        setupViews()
//        animateTitle()
//    }
//    
//    func setupViews() {
//        titleLabel = UILabel()
////        titleLabel.text = "POKEMON LEAFGREEN APP"
//        titleLabel.font = .systemFont(ofSize: 20.0)
//        titleLabel.numberOfLines = 0
//        titleLabel.textAlignment = .left
//        
//        printButton = UIButton()
//        printButton.setTitle("Print from CoreData", for: .normal)
//        printButton.setTitleColor(.black, for: .normal)
//        printButton.titleLabel?.font = .boldSystemFont(ofSize: 16.0)
//        printButton.layer.borderWidth = 5.0
//        printButton.layer.borderColor = UIColor.black.cgColor
//        printButton.addTarget(self, action: #selector(printCoreDataObject), for: .touchUpInside)
//        printButton.isHidden = false
//        
//        self.view.addSubview(titleLabel)
//        self.view.addSubview(printButton)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        printButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0),
//            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0),
//            
//            printButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            printButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30.0),
//            printButton.widthAnchor.constraint(equalToConstant: 180.0),
//            printButton.heightAnchor.constraint(equalToConstant: 90.0)
//        ])
//    }
//    
//    func animateTitle() {
//        var currentIndex = 0
//        let titleMessage = "Pokemon LeafGreen App"
//        titleLabel.text = ""
//        
//        let interval = TimeInterval(2.0) / Double(titleMessage.count)
//        
//        animationTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] timer in
//            guard let self = self else { return }
//            guard currentIndex < titleMessage.count else {
//                timer.invalidate()
//                return
//            }
//            
//            let index = titleMessage.index(titleMessage.startIndex, offsetBy: currentIndex)
//            titleLabel.text?.append(titleMessage[index])
//            currentIndex += 1
//        }
//    }
//
//    func callPokeAPINetworkServiceForBulbasaur() {
//        let pokemonRequest = PokeAPIRequest<PokeAPIPokemonDetails>(endpoint: .pokemon, id: 7)
//        let pokemonSpeciesRequest = PokeAPIRequest<PokeAPIPokemonSpeciesDetails>(endpoint: .species, id: 7)
//        
//        Task {
//            do {
//                let pokemonResponse = try await pokeAPINetworkService.callPokeAPIServer(with: pokemonRequest)
//                let pokemonSpeciesResponse = try await pokeAPINetworkService.callPokeAPIServer(with: pokemonSpeciesRequest)
//                try await coreDataNetworkService.saveCoreDataPokemonModel(pokeAPIPokemon: pokemonResponse, pokeAPIPokemonSpecies: pokemonSpeciesResponse)
//                DispatchQueue.main.async {
//                    print(pokemonResponse.name)
//                    self.printButton.isHidden = false
//                }
//            } catch let error as PokemonLeafGreenError {
//                print(error.errorLogDescription)
//                print(error.clientDescription)
//            }
//        }
//    }
//    
//    @objc
//    func printCoreDataObject(sender: UIButton) {
//        do {
//            let coreDataFetchRequest = CoreDataRequest<CoreDataPokemon>(identifierKey: #keyPath(CoreDataPokemon.name), identifierStringValue: "squirtle")
//            let coreDataPokemonModel = try coreDataNetworkService.fetchCoreDataModel(with: coreDataFetchRequest)
//            
//            print("Id: \(coreDataPokemonModel.id)")
//            print("Pokemon: \(coreDataPokemonModel.name)")
//            print("Base Experience: \(coreDataPokemonModel.baseExperience)")
//            print("Growth Rate: \(coreDataPokemonModel.growthRate)")
//            print("Type: \(coreDataPokemonModel.type)")
//            print("Description: \(coreDataPokemonModel.pokemonDescription)")
//            print("\n")
//            print("Stats")
//            for stat in coreDataPokemonModel.stats {
//                guard let pokemonStat = stat as? CoreDataPokemonStat else {
//                    print("could not convert NSSet to CoreDataPokemonStat")
//                    return
//                }
//                print(pokemonStat.name)
//                print(" - Base Value: \(pokemonStat.baseValue)")
//                print(" - Individual Value: \(pokemonStat.individualValue)")
//                print(" - Effort Value: \(pokemonStat.effortValue)")
//            }
//
//            print("\nMoves")
//            for move in coreDataPokemonModel.moves {
//                guard let pokemonMove = move as? CoreDataPokemonMoveList else {
//                    print("could not convert NSSet to CoreDataPokemonMoveList")
//                    return
//                }
//                
//                print("\(pokemonMove.name) - \(pokemonMove.id)")
//                print(" - Level Learned At: \(pokemonMove.levelLearnedAt)")
//            }
//        } catch let error as PokemonLeafGreenError {
//            print(error.clientDescription)
//            print(error.errorLogDescription)
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//}
//
