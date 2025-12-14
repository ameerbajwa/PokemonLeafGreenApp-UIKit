//
//  PokemonBattleMoveDetailView.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 9/1/25.
//

import Foundation
import UIKit
import Combine

class PokemonBattleMoveDetailView: UIView {
//    weak var viewModel: BattleViewModel?
    
    var moveDetailView: UIView!
    
    var moveNameLabel: UILabel!
    var moveTypeLabel: UILabel!
    var movePPLabel: UILabel!
    var moveLabelStackView: UIStackView!

    var moveDescriptionLabel: UILabel!
    
    var damageLabel: UILabel!
    var statusChangeLabel: UILabel!
    var damageEffectStackView: UIStackView!
    
    var useButton: UIButton!
    var cancelButton: UIButton!
    var buttonStackView: UIStackView!
    
    func setupMoveDetailView() {
        moveDetailView = UIView()
        moveDetailView.layer.cornerRadius = 5.0
        moveDetailView.layer.borderWidth = 5.0
        moveDetailView.layer.borderColor = UIColor.black.cgColor
        
        moveNameLabel = UILabel()
        moveNameLabel.font = .boldSystemFont(ofSize: 16.0)
        moveNameLabel.textColor = .black
        moveNameLabel.textAlignment = .center
        
        moveTypeLabel = UILabel()
        moveTypeLabel.font = .systemFont(ofSize: 16.0)
        moveTypeLabel.textColor = .black
        moveTypeLabel.textAlignment = .center
        
        movePPLabel = UILabel()
        movePPLabel.font = .systemFont(ofSize: 16.0)
        movePPLabel.textColor = .systemGray
        movePPLabel.textAlignment = .center
        
        moveLabelStackView = UIStackView(arrangedSubviews: [moveNameLabel, moveTypeLabel, movePPLabel])
        moveLabelStackView.axis = .horizontal
        moveLabelStackView.distribution = .fillEqually
        moveLabelStackView.spacing = 20.0
        moveLabelStackView.alignment = .center
        
        moveDescriptionLabel = UILabel()
        moveDescriptionLabel.font = .systemFont(ofSize: 14.0)
        moveDescriptionLabel.textColor = .black
        moveDescriptionLabel.textAlignment = .left
        moveDescriptionLabel.numberOfLines = 0
        
        damageLabel = UILabel()
        damageLabel.font = .boldSystemFont(ofSize: 16.0)
        damageLabel.textColor = .black
        damageLabel.textAlignment = .center
        
        statusChangeLabel = UILabel()
        statusChangeLabel.font = .boldSystemFont(ofSize: 16.0)
        statusChangeLabel.textColor = .black
        statusChangeLabel.textAlignment = .center
        
        damageEffectStackView = UIStackView(arrangedSubviews: [damageLabel, statusChangeLabel])
        damageEffectStackView.axis = .horizontal
        damageEffectStackView.distribution = .fillEqually
        damageEffectStackView.spacing = 20.0
        damageEffectStackView.alignment = .center
        
        cancelButton = UIButton()
        cancelButton.setTitle("CANCEL", for: .normal)
        cancelButton.titleLabel?.textColor = .black
        cancelButton.layer.cornerRadius = 5.0
        cancelButton.layer.borderWidth = 5.0
        cancelButton.layer.borderColor = UIColor.black.cgColor
        
        useButton = UIButton()
        useButton.setTitle("USE", for: .normal)
        useButton.titleLabel?.textColor = .black
        useButton.layer.cornerRadius = 5.0
        useButton.layer.borderWidth = 5.0
        useButton.layer.borderColor = UIColor.black.cgColor
        
        buttonStackView = UIStackView(arrangedSubviews: [cancelButton, useButton])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.alignment = .center
        buttonStackView.spacing = 20.0
        
        moveDetailView.addSubview(moveLabelStackView)
        moveDetailView.addSubview(moveDescriptionLabel)
        moveDetailView.addSubview(damageEffectStackView)
        self.addSubview(moveDetailView)
        self.addSubview(buttonStackView)
        
        moveLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        moveDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        damageEffectStackView.translatesAutoresizingMaskIntoConstraints = false
        moveDetailView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moveLabelStackView.centerXAnchor.constraint(equalTo: moveDetailView.centerXAnchor),
            moveLabelStackView.topAnchor.constraint(equalTo: moveDetailView.topAnchor, constant: 15.0),
            moveLabelStackView.leadingAnchor.constraint(equalTo: moveDetailView.leadingAnchor, constant: 15.0),
            moveLabelStackView.trailingAnchor.constraint(equalTo: moveDetailView.trailingAnchor, constant: -15.0),
            
            moveDescriptionLabel.topAnchor.constraint(equalTo: moveLabelStackView.bottomAnchor, constant: 15.0),
            moveDescriptionLabel.centerXAnchor.constraint(equalTo: moveDetailView.centerXAnchor),
            moveDescriptionLabel.leadingAnchor.constraint(equalTo: moveDetailView.leadingAnchor, constant: 20.0),
            moveDescriptionLabel.trailingAnchor.constraint(equalTo: moveDetailView.trailingAnchor, constant: -20.0),
            
            damageEffectStackView.topAnchor.constraint(equalTo: moveDescriptionLabel.bottomAnchor, constant: 15.0),
            damageEffectStackView.centerXAnchor.constraint(equalTo: moveDetailView.centerXAnchor),
            damageEffectStackView.leadingAnchor.constraint(equalTo: moveDetailView.leadingAnchor, constant: 15.0),
            damageEffectStackView.trailingAnchor.constraint(equalTo: moveDetailView.trailingAnchor, constant: -15.0),
            damageEffectStackView.bottomAnchor.constraint(equalTo: moveDetailView.bottomAnchor, constant: -15.0),
            
            moveDetailView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5.0),
            moveDetailView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0),
            moveDetailView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5.0),
            moveDetailView.heightAnchor.constraint(equalToConstant: 400.0),
            
            buttonStackView.topAnchor.constraint(equalTo: moveDetailView.bottomAnchor, constant: 15.0),
            buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
            buttonStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15.0)
        ])
    }
    
    func configure() {
        
    }
}
