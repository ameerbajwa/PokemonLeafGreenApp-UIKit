//
//  PokemonBattleTextView.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/24/25.
//

import Foundation
import UIKit
import Combine

class PokemonBattleTextView: UIView {
    var pokemonBattleText: UILabel!
    var nextButton: UIButton!
    
    private var cancellables = Set<AnyCancellable>()
    
    func setupPokemonBattleText() {
        pokemonBattleText = UILabel()
        pokemonBattleText.font = .systemFont(ofSize: 16.0)
        pokemonBattleText.numberOfLines = 0
        pokemonBattleText.textAlignment = .left
        pokemonBattleText.textColor = .black
        
        nextButton = UIButton()
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.titleLabel?.font = .boldSystemFont(ofSize: 18.0)
        nextButton.layer.borderColor = UIColor.black.cgColor
        nextButton.layer.cornerRadius = 5.0
        nextButton.layer.borderWidth = 5.0
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        self.addSubview(pokemonBattleText)
        self.addSubview(nextButton)
        pokemonBattleText.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pokemonBattleText.topAnchor.constraint(equalTo: self.topAnchor, constant: 20.0),
            pokemonBattleText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            pokemonBattleText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0),
            
            nextButton.topAnchor.constraint(equalTo: self.pokemonBattleText.bottomAnchor, constant: 20.0),
            nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 120.0),
            nextButton.heightAnchor.constraint(equalToConstant: 80.0),
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20.0)
        ])
    }
    
//    func bindUIComponentsToViewModel() {
//        viewModel?.$battleText
//            .receive(on: RunLoop.main)
//            .sink { [weak self] newBattleText in
//                self?.pokemonBattleText.text = newBattleText
//            }
//            .store(in: &cancellables)
//    }
    
    @objc
    func nextButtonTapped() {
    }
}
