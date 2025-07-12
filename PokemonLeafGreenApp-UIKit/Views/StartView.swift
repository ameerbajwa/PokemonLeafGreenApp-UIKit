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
    var titleAnimationTimer: Timer?
    
    weak var viewModel: StartViewModeling?
    
    func setupViews() {
        guard let controllerViewFrame = viewModel?.controllerView?.frame else {
            print("Could not obtain controller view frame")
            return
        }
        titleLabel = UILabel()
        titleLabel.text = "Pokemon LeafGreen Game App"
        titleLabel.frame = CGRect(x: 20, y: -60, width: controllerViewFrame.width - 40, height: 80)
        titleLabel.font = .boldSystemFont(ofSize: 28)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        pokemonDefenderImageView = UIImageView()
        pokemonDefenderImageView.frame = CGRect(x: controllerViewFrame.width + 190, y: titleLabel.frame.size.height + 60, width: 170, height: 170)
        pokemonAttackerImageView = UIImageView()
        pokemonAttackerImageView.frame = CGRect(x: -190, y: titleLabel.frame.size.height + 230, width: 170, height: 170)
        
        newGameButton = UIButton()
        newGameButton.setTitle("New Game", for: .normal)
        newGameButton.setTitleColor(.black, for: .normal)
        newGameButton.titleLabel?.font = .boldSystemFont(ofSize: 18.0)
        newGameButton.layer.borderWidth = 5.0
        newGameButton.layer.borderColor = UIColor.black.cgColor
        
        loadGameButton = UIButton()
        loadGameButton.setTitle("Load Game", for: .normal)
        loadGameButton.setTitleColor(.black, for: .normal)
        loadGameButton.titleLabel?.font = .boldSystemFont(ofSize: 18.0)
        loadGameButton.layer.borderWidth = 5.0
        loadGameButton.layer.borderColor = UIColor.black.cgColor
        
        buttonStackView = UIStackView(arrangedSubviews: [newGameButton, loadGameButton])
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 30.0
        buttonStackView.distribution = .fillEqually
        buttonStackView.isHidden = true
        
        self.addSubview(titleLabel)
        self.addSubview(pokemonDefenderImageView)
        self.addSubview(pokemonAttackerImageView)
        self.addSubview(buttonStackView)

        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonStackView.topAnchor.constraint(equalTo: self.pokemonAttackerImageView.bottomAnchor, constant: 20.0),
            buttonStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20.0),
            buttonStackView.widthAnchor.constraint(equalToConstant: 175.0)
        ])
    }
    
    func setUpImages() {
        Task {
            let images = await viewModel?.generatePokemonImages()
            pokemonAttackerImageView.image = images?.0
            pokemonDefenderImageView.image = images?.1
        }
    }
}

extension StartView {
    func animateTitle() {
        let titleAnimation = CABasicAnimation(keyPath: "position.y")
        titleAnimation.fromValue = -60
        titleAnimation.toValue = 40 + titleLabel.frame.size.height / 2
        titleAnimation.duration = 1.0
        titleAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        
        titleLabel.layer.position.y = 40 + titleLabel.frame.size.height / 2
        
        titleLabel.layer.add(titleAnimation, forKey: "slideDown")
    }
    
    func animateAttackerImage() {
        let imageAnimation = CABasicAnimation(keyPath: "position.x")
        imageAnimation.fromValue = -190
        imageAnimation.toValue = 20 + pokemonAttackerImageView.frame.size.width / 2
        imageAnimation.duration = 1.0
        imageAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        
        pokemonAttackerImageView.layer.position.x = 20 + pokemonAttackerImageView.frame.size.width / 2
        
        pokemonAttackerImageView.layer.add(imageAnimation, forKey: "slideIn")
    }
    
    func animateDefenderImage() {
        guard let controllerViewFrame = viewModel?.controllerView?.frame else {
            print("Could not obtain controller view frame when trying to animate the defender image")
            return
        }
        let imageAnimation = CABasicAnimation(keyPath: "position.x")
        imageAnimation.fromValue = controllerViewFrame.width + 190
        imageAnimation.toValue = controllerViewFrame.width - 190 + pokemonDefenderImageView.frame.size.width / 2
        imageAnimation.duration = 1.0
        imageAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        
        pokemonDefenderImageView.layer.position.x = controllerViewFrame.width - 190 + pokemonDefenderImageView.frame.size.width / 2
        
        pokemonDefenderImageView.layer.add(imageAnimation, forKey: "slideIn")
    }
}
