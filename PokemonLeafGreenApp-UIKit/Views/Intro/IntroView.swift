//
//  IntroView.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/16/25.
//

import Foundation
import UIKit

@MainActor
class IntroView: UIView {
    weak var viewModel: IntroViewModel?
    
    var introTextView: IntroTextView!
    var playerNameTextField: UITextField!
    
    var bulbasaurImageView: UIImageView!
    var charmanderImageView: UIImageView!
    var squirtleImageView: UIImageView!
    
    func setupIntroTextView() {
        introTextView = IntroTextView()
        introTextView.layer.borderWidth = 3.0
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
            self.playerNameTextField = PaddedTextField()
            self.playerNameTextField.placeholder = "Enter player name"
            self.playerNameTextField.font = UIFont.systemFont(ofSize: 18.0)
            self.playerNameTextField.backgroundColor = .white
            self.playerNameTextField.textColor = .black
            self.playerNameTextField.layer.cornerRadius = 12.0
            self.playerNameTextField.layer.borderWidth = 1.0
            self.playerNameTextField.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
            self.playerNameTextField.keyboardType = .default
            self.playerNameTextField.returnKeyType = .done
            self.playerNameTextField.enablesReturnKeyAutomatically = true
            self.playerNameTextField.delegate = self.viewModel
            self.playerNameTextField.isHidden = true
            
            self.addSubview(self.playerNameTextField)
            self.playerNameTextField.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                self.playerNameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                self.playerNameTextField.heightAnchor.constraint(equalToConstant: 50.0),
                self.playerNameTextField.widthAnchor.constraint(equalToConstant: 250.0),
                self.playerNameTextField.bottomAnchor.constraint(equalTo: self.introTextView.topAnchor, constant: -200.0)
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
            self.bulbasaurImageView = UIImageView()
            self.bulbasaurImageView.isUserInteractionEnabled = true
            self.bulbasaurImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.bulbasaurImageViewTapped(tapGestureRecognizer:))))
            self.bulbasaurImageView.layer.cornerRadius = 10
            self.bulbasaurImageView.layer.borderWidth = 3
            self.bulbasaurImageView.layer.borderColor = UIColor.black.cgColor
            
            self.charmanderImageView = UIImageView()
            self.charmanderImageView.isUserInteractionEnabled = true
            self.charmanderImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.charmanderImageViewTapped(tapGestureRecognizer:))))
            self.charmanderImageView.layer.cornerRadius = 10
            self.charmanderImageView.layer.borderWidth = 3
            self.charmanderImageView.layer.borderColor = UIColor.black.cgColor
            
            self.squirtleImageView = UIImageView()
            self.squirtleImageView.isUserInteractionEnabled = true
            self.squirtleImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.squirtleImageViewTapped(tapGestureRecognizer:))))
            self.squirtleImageView.layer.cornerRadius = 10
            self.squirtleImageView.layer.borderWidth = 3
            self.squirtleImageView.layer.borderColor = UIColor.black.cgColor
            
            self.addSubview(self.bulbasaurImageView)
            self.addSubview(self.charmanderImageView)
            self.addSubview(self.squirtleImageView)
            
            self.bulbasaurImageView.translatesAutoresizingMaskIntoConstraints = false
            self.charmanderImageView.translatesAutoresizingMaskIntoConstraints = false
            self.squirtleImageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                self.bulbasaurImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50.0),
                self.bulbasaurImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50.0),
                self.bulbasaurImageView.widthAnchor.constraint(equalToConstant: 140.0),
                self.bulbasaurImageView.heightAnchor.constraint(equalToConstant: 140.0),
                
                self.charmanderImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50.0),
                self.charmanderImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50.0),
                self.charmanderImageView.widthAnchor.constraint(equalToConstant: 140.0),
                self.charmanderImageView.heightAnchor.constraint(equalToConstant: 140.0),
                
                self.squirtleImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 240.0),
                self.squirtleImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                self.squirtleImageView.widthAnchor.constraint(equalToConstant: 140.0),
                self.squirtleImageView.heightAnchor.constraint(equalToConstant: 140.0),
            ])
        }
    }
    
    func removeStarterPokmeonButons() {
        DispatchQueue.main.async {
            self.bulbasaurImageView.removeFromSuperview()
            self.charmanderImageView.removeFromSuperview()
            self.squirtleImageView.removeFromSuperview()
            self.bulbasaurImageView = nil
            self.charmanderImageView = nil
            self.squirtleImageView = nil
        }
    }
    
    func setUpImagesForStarterPokemonButtons() {
        Task {
            async let bulbasaurImage = viewModel?.generatePokemonImage(id: 1)
            async let charmanderImage = viewModel?.generatePokemonImage(id: 4)
            async let squirtleImage = viewModel?.generatePokemonImage(id: 7)
            
            let (bulbaImage, charImage, squirtImage) = await (bulbasaurImage, charmanderImage, squirtleImage)
            
            bulbasaurImageView.image = bulbaImage
            charmanderImageView.image = charImage
            squirtleImageView.image = squirtImage
        }
    }
}

// MARK: - Starter Pokemon Selected Delegate methods

@MainActor
extension IntroView {
    @objc
    func bulbasaurImageViewTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        viewModel?.displayPokemonSelectedMessage(message: NewJourneyMessages.chooseBulbasaur, selectedPokemon: "bulbasaur")
    }
    
    @objc
    func charmanderImageViewTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        viewModel?.displayPokemonSelectedMessage(message: NewJourneyMessages.chooseCharmander, selectedPokemon: "charmander")
    }
    
    @objc
    func squirtleImageViewTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        viewModel?.displayPokemonSelectedMessage(message: NewJourneyMessages.chooseSquirtle, selectedPokemon: "squirtle")

    }
}
