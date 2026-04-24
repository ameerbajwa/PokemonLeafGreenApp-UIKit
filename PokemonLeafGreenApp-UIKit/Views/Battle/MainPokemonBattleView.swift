//
//  MainPokemonBattleView.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 4/19/26.
//

import UIKit
import Foundation

class MainPokemonBattleView: UIView {
    var pokemonBattleDisplayView: PokemonBattleView!
    var pokemonBattleActionView: UIView!
    
    var pokemonBattleActionMainView: PokemonBattleActionMainView!
    var pokemonBattleActionTextView: PokemonBattleActionTextView!
    var pokemonBattleActionMoveListView: PokemonBattleActionMoveListView!
}

// MARK: - Set up all Display and Action Views
extension MainPokemonBattleView {
    func initializeAllBattleViews() {
        pokemonBattleDisplayView = PokemonBattleView()
        // Setup pokemonBattleDisplayView by getting the starting pokemon images and corresponding HP bar images on screen
        
        pokemonBattleActionMainView = PokemonBattleActionMainView()
        pokemonBattleActionMainView.setupActionButtonView()
        // needs a delegate to be set for button clicks
        
        pokemonBattleActionTextView = PokemonBattleActionTextView()
        pokemonBattleActionTextView.setupPokemonBattleText()
        // needs a delegate to be set for next button click and change of label
        
        pokemonBattleActionMoveListView = PokemonBattleActionMoveListView()
        pokemonBattleActionMoveListView.setupMoveListView()
        // needs delegates for UITableView data source and delegate
    }
}

// MARK: - Setup of Display and Action Views on Main UIView for Pokemon Battle
extension MainPokemonBattleView {
    func initalizeStartBattleDisplayAndActionViews() {
        self.addSubview(self.pokemonBattleDisplayView)
        pokemonBattleDisplayView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pokemonBattleDisplayView.topAnchor.constraint(equalTo: self.topAnchor),
            pokemonBattleDisplayView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            pokemonBattleDisplayView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
                
        pokemonBattleActionView.layer.borderWidth = 3.0
        pokemonBattleActionView.layer.borderColor = UIColor.black.cgColor
        pokemonBattleActionView.layer.cornerRadius = 5.0
        
        self.addSubview(self.pokemonBattleActionView)
        pokemonBattleActionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pokemonBattleActionView.topAnchor.constraint(equalTo: self.pokemonBattleDisplayView.bottomAnchor),
            pokemonBattleActionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            pokemonBattleActionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            pokemonBattleActionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            pokemonBattleActionView.heightAnchor.constraint(equalToConstant: 300.0)
        ])
    }
}

// MARK: - Switching between Action Views
extension MainPokemonBattleView {
    func switchToActionMainView() {
        pokemonBattleActionView = pokemonBattleActionMainView
    }
    
    func switchToActionTextView() {
        pokemonBattleActionView = pokemonBattleActionTextView
    }
    
    func switchToActionMoveList() {
        pokemonBattleActionView = pokemonBattleActionMoveListView
    }
}
