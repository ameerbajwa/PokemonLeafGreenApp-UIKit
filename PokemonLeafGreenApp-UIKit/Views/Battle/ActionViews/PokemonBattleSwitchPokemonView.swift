//
//  PokemonBattleSwitchPokemonView.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 9/1/25.
//

import Foundation
import UIKit
import Combine

class PokemonBattleSwitchPokemonView: UIView {
    var switchPokemonLabel: UILabel!
    
    var noButton: UIButton!
    var yesButton: UIButton!
    var buttonStackView: UIStackView!
    
    func setupSwitchPokemonView() {
        switchPokemonLabel = UILabel()
        switchPokemonLabel.textColor = .black
        switchPokemonLabel.numberOfLines = 0
        switchPokemonLabel.font = .systemFont(ofSize: 18.0)
        switchPokemonLabel.textAlignment = .center
        
        noButton = UIButton()
        noButton.setTitle("NO", for: .normal)
        noButton.setTitleColor(.black, for: .normal)
        noButton.layer.cornerRadius = 5.0
        noButton.layer.borderWidth = 5.0
        noButton.layer.borderColor = UIColor.black.cgColor
        
        yesButton = UIButton()
        yesButton.setTitle("YES", for: .normal)
        yesButton.setTitleColor(.black, for: .normal)
        yesButton.layer.cornerRadius = 5.0
        yesButton.layer.borderWidth = 5.0
        yesButton.layer.borderColor = UIColor.black.cgColor
        
        buttonStackView = UIStackView(arrangedSubviews: [noButton, yesButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 25.0
        buttonStackView.distribution = .fillEqually
        buttonStackView.alignment = .center
        
        self.addSubview(switchPokemonLabel)
        self.addSubview(buttonStackView)
        switchPokemonLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            switchPokemonLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            switchPokemonLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20.0),
            switchPokemonLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            switchPokemonLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
            
            buttonStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15.0),
            buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0),
            buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15.0),
            buttonStackView.heightAnchor.constraint(equalToConstant: 75.0)
        ])
    }
}
