//
//  PokemonBattleActionMainView.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 4/19/26.
//

import UIKit
import Foundation

class PokemonBattleActionMainView: UIView {
    var fightButton: UIButton!
    var switchButton: UIButton!
    var buttonStackView: UIStackView!
    
    func setupActionButtonView() {
        fightButton = UIButton()
        fightButton.titleLabel?.font = .boldSystemFont(ofSize: 18.0)
        fightButton.setTitleColor(.black, for: .normal)
        fightButton.layer.cornerRadius = 5.0
        fightButton.layer.borderWidth = 5.0
        fightButton.layer.borderColor = UIColor.black.cgColor
        fightButton.titleLabel?.text = "Fight"
        fightButton.addTarget(self, action: #selector(fightButtonTapped), for: .touchUpInside)
        
        switchButton = UIButton()
        switchButton.titleLabel?.font = .boldSystemFont(ofSize: 18.0)
        switchButton.setTitleColor(.black, for: .normal)
        switchButton.layer.cornerRadius = 5.0
        switchButton.layer.borderWidth = 5.0
        switchButton.layer.borderColor = UIColor.black.cgColor
        switchButton.titleLabel?.text = "Switch"
        switchButton.addTarget(self, action: #selector(switchButtonTapped), for: .touchUpInside)
        
        buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 25.0
        buttonStackView.addArrangedSubview(fightButton)
        buttonStackView.addArrangedSubview(switchButton)
        
        self.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 100.0),
            buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50.0),
            buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50.0)
        ])
    }
    
    @objc
    func fightButtonTapped() {
    }
    
    @objc
    func switchButtonTapped() {
    }
}
