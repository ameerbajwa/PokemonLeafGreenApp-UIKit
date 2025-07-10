//
//  StartView.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/3/25.
//

import Foundation
import UIKit

class StartView: UIView {
    var titleLabel: UILabel!
    var pokemonAttackerImageView: UIImageView!
    var pokemonDefenderImageView: UIImageView!
    var newGameButton: UIButton!
    var loadGameButton: UIButton!
    var buttonStackView: UIStackView!
    
    weak var viewModel: StartViewModeling?
    
    func setupViews() {
        titleLabel = UILabel()
        titleLabel.font = .boldSystemFont(ofSize: 30)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        pokemonAttackerImageView = UIImageView()
        pokemonDefenderImageView = UIImageView()
        
        newGameButton = UIButton()
        newGameButton.setTitle("New Game", for: .normal)
        newGameButton.setTitleColor(.black, for: .normal)
        newGameButton.titleLabel?.font = .boldSystemFont(ofSize: 16.0)
        newGameButton.layer.borderWidth = 5.0
        newGameButton.layer.borderColor = UIColor.black.cgColor
        
        loadGameButton = UIButton()
        loadGameButton.setTitle("Load Game", for: .normal)
        loadGameButton.setTitleColor(.black, for: .normal)
        loadGameButton.titleLabel?.font = .boldSystemFont(ofSize: 16.0)
        loadGameButton.layer.borderWidth = 5.0
        loadGameButton.layer.borderColor = UIColor.black.cgColor
        
        buttonStackView = UIStackView(arrangedSubviews: [newGameButton, loadGameButton])
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 30.0
        buttonStackView.distribution = .fillEqually
        
        self.addSubview(titleLabel)
        self.addSubview(pokemonDefenderImageView)
        self.addSubview(pokemonAttackerImageView)
        self.addSubview(buttonStackView)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonDefenderImageView.translatesAutoresizingMaskIntoConstraints = false
        pokemonAttackerImageView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30.0),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30.0),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30.0),
            
            pokemonDefenderImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.0),
            pokemonDefenderImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
            pokemonDefenderImageView.widthAnchor.constraint(equalToConstant: 150.0),
            pokemonDefenderImageView.heightAnchor.constraint(equalToConstant: 150.0),
            
            pokemonAttackerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            pokemonAttackerImageView.topAnchor.constraint(equalTo: pokemonDefenderImageView.bottomAnchor, constant: 10.0),
            pokemonAttackerImageView.widthAnchor.constraint(equalToConstant: 150.0),
            pokemonAttackerImageView.heightAnchor.constraint(equalToConstant: 150.0),
            
            buttonStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonStackView.topAnchor.constraint(equalTo: pokemonAttackerImageView.bottomAnchor, constant: 20.0),
            buttonStackView.widthAnchor.constraint(equalToConstant: 150.0)
        ])
    }
    
    func animateTitle() {
        viewModel?.animateTitle(titleLabel: titleLabel)
    }
    
    func setUpImages() {
        Task {
            let images = await viewModel?.generatePokemonImages()
            pokemonAttackerImageView.image = images?.0
            pokemonDefenderImageView.image = images?.1
        }
    }
}
