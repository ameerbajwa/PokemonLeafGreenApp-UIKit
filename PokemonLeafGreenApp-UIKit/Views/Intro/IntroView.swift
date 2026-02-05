//
//  IntroView.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/16/25.
//

import Foundation
import UIKit

class IntroView: UIView {
    var playerNameTextField: UITextField!
    var bulbasaurImageView: UIImageView!
    var charmanderImageView: UIImageView!
    var squirtleImageView: UIImageView!
    var selectedPokemonImageView: UIImageView!
    var introTextViewTopAnchor: NSLayoutYAxisAnchor!
    
    weak var delegate: IntroViewManaging?
    
    func setupPlayerNameTextField() {
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
        self.playerNameTextField.delegate = delegate
        self.playerNameTextField.isHidden = true
        self.playerNameTextField.isEnabled = false
        
        self.addSubview(self.playerNameTextField)
        self.playerNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.playerNameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.playerNameTextField.heightAnchor.constraint(equalToConstant: 50.0),
            self.playerNameTextField.widthAnchor.constraint(equalToConstant: 250.0),
            self.playerNameTextField.bottomAnchor.constraint(equalTo: introTextViewTopAnchor, constant: -200.0)
            
        ])
    }
    
    func removePlayerNameTextFieldFromView() {
        self.playerNameTextField.removeFromSuperview()
        self.playerNameTextField = nil
    }
    
    func setupStarterPokemonButtons() {
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
            self.bulbasaurImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40.0),
            self.bulbasaurImageView.widthAnchor.constraint(equalToConstant: 120.0),
            self.bulbasaurImageView.heightAnchor.constraint(equalToConstant: 120.0),
            
            self.charmanderImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50.0),
            self.charmanderImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40.0),
            self.charmanderImageView.widthAnchor.constraint(equalToConstant: 120.0),
            self.charmanderImageView.heightAnchor.constraint(equalToConstant: 120.0),
            
            self.squirtleImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 220.0),
            self.squirtleImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.squirtleImageView.widthAnchor.constraint(equalToConstant: 120.0),
            self.squirtleImageView.heightAnchor.constraint(equalToConstant: 120.0),
        ])
    }
    
    func removeStarterPokemonButons() {
        self.bulbasaurImageView.removeFromSuperview()
        self.charmanderImageView.removeFromSuperview()
        self.squirtleImageView.removeFromSuperview()
    }
    
    func setUpImagesForStarterPokemonButtons(bulbasaurImageData: Data, charmanderImageData: Data, squirtleImageData: Data) {
        bulbasaurImageView.image = UIImage(data: bulbasaurImageData)
        charmanderImageView.image = UIImage(data: charmanderImageData)
        squirtleImageView.image = UIImage(data: squirtleImageData)
    }
    
    func setupSelectedPokemonImage(pokemon: PokemonIdNameConfiguration) {
        switch pokemon {
        case .bulbasaur:
            self.selectedPokemonImageView = bulbasaurImageView
        case .charmander:
            self.selectedPokemonImageView = charmanderImageView
        case .squirtle:
            self.selectedPokemonImageView = squirtleImageView
        default:
            self.selectedPokemonImageView = nil
        }
        
        self.selectedPokemonImageView.layer.cornerRadius = 10
        self.selectedPokemonImageView.layer.borderWidth = 3
        self.selectedPokemonImageView.layer.borderColor = UIColor.black.cgColor
        
        self.addSubview(self.selectedPokemonImageView)
        self.selectedPokemonImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.selectedPokemonImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.selectedPokemonImageView.bottomAnchor.constraint(equalTo: introTextViewTopAnchor, constant: -100.0)
        ])
    }
    
    func removeSelectedPokemonImage() {
        self.selectedPokemonImageView.removeFromSuperview()
    }
}

// MARK: - Starter Pokemon Selected Delegate methods
extension IntroView {
    @objc
    func bulbasaurImageViewTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        delegate?.setSelectedStarterPokemon(pokemon: .bulbasaur)
    }
    
    @objc
    func charmanderImageViewTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        delegate?.setSelectedStarterPokemon(pokemon: .charmander)
    }
    
    @objc
    func squirtleImageViewTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        delegate?.setSelectedStarterPokemon(pokemon: .squirtle)
    }
}
