//
//  BattleViewModel.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/22/25.
//

import Foundation
import UIKit
import Combine

class BattleViewModel {
    var configuration: PokemonBattleConfiguration
    var coreDataNetworkService: CoreDataNetworkService
    weak var controller: BattleViewController?
    
    var playerInfo: CoreDataGamePlayer?
    
    @Published var battleText: String = ""
    
    init(configuration: PokemonBattleConfiguration, coreDataNetworkService: CoreDataNetworkService) {
        self.configuration = configuration
        self.coreDataNetworkService = coreDataNetworkService
        
        fetchPlayerInfo()
    }
    
    func fetchPlayerInfo() {
        do {
            let coreDataFetchRequest = CoreDataRequest<CoreDataGamePlayer>(identifierKey: #keyPath(CoreDataGamePlayer.id), identifierIntValue: 1)
            playerInfo = try coreDataNetworkService.fetchCoreDataModel(with: coreDataFetchRequest)
        } catch let error as PokemonLeafGreenError {
            print(error.errorLogDescription)
        } catch {
            print(error)
        }
    }
}

// MARK: - Battle UI Delegate Methods

extension BattleViewModel {
    func dismissText() {
        
    }
    
    func displayMoveList() {
        
    }
    
    func displayPokemonList() {
        
    }
}
