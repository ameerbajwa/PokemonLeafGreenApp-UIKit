//
//  IntroView.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/16/25.
//

import Foundation
import UIKit

class IntroView: UIView {
    weak var viewModel: IntroViewModel?
    
    var introTextView: IntroTextView!
    var playerNameTextField: UITextField!
    
    var bulbasaurImageButton: UIButton!
    var charmanderImageButton: UIButton!
    var squirtleImageButton: UIButton!
    var horizontalPokemonStackView: UIStackView!
    
    func setupIntroTextView() {
        introTextView = IntroTextView()
        introTextView.layer.borderWidth = 5.0
        introTextView.layer.borderColor = UIColor.black.cgColor
        introTextView.layer.cornerRadius = 5.0
        
        introTextView.setupIntroLabelAndNextButton()
        introTextView.viewModel = viewModel
        
        self.addSubview(introTextView)
        introTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            introTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5.0),
            introTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0),
            introTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5.0),
            introTextView.heightAnchor.constraint(equalToConstant: 250.0)
        ])
    }
    
    func setupPlayerNameTextField() {
        DispatchQueue.main.async {
            self.playerNameTextField = UITextField()
            self.playerNameTextField.placeholder = "Enter player name"
            self.playerNameTextField.font = UIFont.systemFont(ofSize: 18.0)
            self.playerNameTextField.backgroundColor = .white
            self.playerNameTextField.textColor = .black
            self.playerNameTextField.layer.cornerRadius = 10.0
            self.playerNameTextField.layer.borderWidth = 5.0
            self.playerNameTextField.layer.borderColor = UIColor.black.cgColor
            self.playerNameTextField.keyboardType = .default
            self.playerNameTextField.delegate = self.viewModel
            
            self.addSubview(self.playerNameTextField)
            self.playerNameTextField.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                self.playerNameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                self.playerNameTextField.heightAnchor.constraint(equalToConstant: 75.0),
                self.playerNameTextField.widthAnchor.constraint(equalToConstant: 250.0),
                self.playerNameTextField.bottomAnchor.constraint(equalTo: self.introTextView.topAnchor, constant: -50.0)
            ])
        }
    }
    
    func removePlayerNameTextFieldFromView() {
        DispatchQueue.main.async {
            self.playerNameTextField.removeFromSuperview()
            self.playerNameTextField = nil
        }
    }
    
    func setupStarterPokemonButtons() {
        DispatchQueue.main.async {
            self.bulbasaurImageButton = UIButton()
            self.bulbasaurImageButton.addTarget(self, action: #selector(self.bulbasaurImageButtonTapped), for: .touchUpInside)
            self.bulbasaurImageButton.layer.cornerRadius = 10
            self.bulbasaurImageButton.layer.borderWidth = 5
            self.bulbasaurImageButton.layer.borderColor = UIColor.black.cgColor
            self.bulbasaurImageButton.frame.size = CGSize(width: 120, height: 120)
            
            self.charmanderImageButton = UIButton()
            self.charmanderImageButton.addTarget(self, action: #selector(self.charmanderImageButtonTapped), for: .touchUpInside)
            self.charmanderImageButton.layer.cornerRadius = 10
            self.charmanderImageButton.layer.borderWidth = 5
            self.charmanderImageButton.layer.borderColor = UIColor.black.cgColor
            self.charmanderImageButton.frame.size = CGSize(width: 120, height: 120)
            
            self.squirtleImageButton = UIButton()
            self.squirtleImageButton.addTarget(self, action: #selector(self.squirtleImageButtonTapped), for: .touchUpInside)
            self.squirtleImageButton.layer.cornerRadius = 10
            self.squirtleImageButton.layer.borderWidth = 5
            self.squirtleImageButton.layer.borderColor = UIColor.black.cgColor
            self.squirtleImageButton.frame.size = CGSize(width: 120, height: 120)
            
            self.horizontalPokemonStackView = UIStackView()
            self.horizontalPokemonStackView.addArrangedSubview(self.bulbasaurImageButton)
            self.horizontalPokemonStackView.addArrangedSubview(self.charmanderImageButton)
            self.horizontalPokemonStackView.axis = .horizontal
            self.horizontalPokemonStackView.spacing = 25.0
            self.horizontalPokemonStackView.distribution = .equalSpacing
            self.horizontalPokemonStackView.alignment = .center
            
            self.addSubview(self.horizontalPokemonStackView)
            self.addSubview(self.squirtleImageButton)
            self.horizontalPokemonStackView.translatesAutoresizingMaskIntoConstraints = false
            self.squirtleImageButton.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                self.horizontalPokemonStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                self.horizontalPokemonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25.0),
                self.horizontalPokemonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25.0),
                self.horizontalPokemonStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 25.0),
                
                self.squirtleImageButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                self.squirtleImageButton.topAnchor.constraint(equalTo: self.horizontalPokemonStackView.bottomAnchor, constant: 25.0),
                self.squirtleImageButton.bottomAnchor.constraint(equalTo: self.introTextView.topAnchor, constant: -25.0)
            ])
        }
    }
    
    func removeStarterPokmeonButons() {
        DispatchQueue.main.async {
            self.bulbasaurImageButton.removeFromSuperview()
            self.charmanderImageButton.removeFromSuperview()
            self.squirtleImageButton.removeFromSuperview()
            self.horizontalPokemonStackView.removeFromSuperview()
            self.bulbasaurImageButton = nil
            self.charmanderImageButton = nil
            self.squirtleImageButton = nil
            self.horizontalPokemonStackView = nil
        }
    }
    
    func setUpImagesForStarterPokemonButtons() {
        Task {
            let bulbasaurImage = await viewModel?.generatePokemonImage(id: 1)
            bulbasaurImageButton.setImage(bulbasaurImage, for: .normal)
            let charmanderImage = await viewModel?.generatePokemonImage(id: 4)
            charmanderImageButton.setImage(charmanderImage, for: .normal)
            let squirtleImage = await viewModel?.generatePokemonImage(id: 7)
            squirtleImageButton.setImage(squirtleImage, for: .normal)
        }
    }
}

// MARK: - Starter Pokemon Selected Delegate methods

extension IntroView {
    @objc
    func bulbasaurImageButtonTapped() {
        viewModel?.displayPokemonSelectedMessage(message: NewJourneyMessages.chooseBulbasaur, selectedPokemon: "bulbasaur")
    }
    
    @objc
    func charmanderImageButtonTapped() {
        viewModel?.displayPokemonSelectedMessage(message: NewJourneyMessages.chooseCharmander, selectedPokemon: "charmander")
    }
    
    @objc
    func squirtleImageButtonTapped() {
        viewModel?.displayPokemonSelectedMessage(message: NewJourneyMessages.chooseSquirtle, selectedPokemon: "squirtle")

    }
}
