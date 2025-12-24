//
//  IntroTextView.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/16/25.
//

import Foundation
import UIKit

class IntroTextView: UIView {
    var messageLabel: UILabel!
    var nextButton: UIButton!
    var cancelButton: UIButton!
    
    weak var introButtonDelegate: IntroButtonManaging?
            
    func setupIntroLabelAndNextButton() {
        messageLabel = UILabel()
        messageLabel.font = .systemFont(ofSize: 16)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .left
        messageLabel.textColor = .black
        
        nextButton = UIButton()
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.titleLabel?.font = .boldSystemFont(ofSize: 18.0)
        nextButton.layer.borderColor = UIColor.black.cgColor
        nextButton.layer.cornerRadius = 5.0
        nextButton.layer.borderWidth = 5.0
        nextButton.addTarget(introButtonDelegate, action: #selector(introButtonDelegate?.nextButtonTapped), for: .touchUpInside)
        
        cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.titleLabel?.font = .boldSystemFont(ofSize: 18.0)
        cancelButton.layer.borderColor = UIColor.black.cgColor
        cancelButton.layer.cornerRadius = 5.0
        cancelButton.layer.borderWidth = 5.0
        cancelButton.addTarget(introButtonDelegate, action: #selector(introButtonDelegate?.cancelButtonTapped), for: .touchUpInside)
        cancelButton.isEnabled = false
        
        let buttonStackView = UIStackView()
        buttonStackView.addArrangedSubview(cancelButton)
        buttonStackView.addArrangedSubview(nextButton)
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 40.0
        buttonStackView.distribution = .fillEqually
        
        self.addSubview(messageLabel)
        self.addSubview(buttonStackView)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0),
            
            buttonStackView.topAnchor.constraint(equalTo: self.messageLabel.bottomAnchor, constant: 10.0),
            buttonStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30.0),
            buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30.0),
            buttonStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0)
        ])
    }
}
