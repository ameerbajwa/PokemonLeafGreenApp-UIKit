//
//  IntroTextView.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/16/25.
//

import Foundation
import UIKit

class IntroTextView: UIView {
    weak var viewModel: IntroViewModel?
    
    var messageLabel: UILabel!
    var nextButton: UIButton!
    var cancelButton: UIButton!
    
    private var animationTimer: Timer?
    
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
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.titleLabel?.font = .boldSystemFont(ofSize: 18.0)
        cancelButton.layer.borderColor = UIColor.black.cgColor
        cancelButton.layer.cornerRadius = 5.0
        cancelButton.layer.borderWidth = 5.0
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        cancelButton.isHidden = true
        
        let buttonStackView = UIStackView()
        buttonStackView.addArrangedSubview(nextButton)
        buttonStackView.addArrangedSubview(cancelButton)
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

extension IntroTextView {
    @objc
    func nextButtonTapped() {
        viewModel?.displayNextMessage()
    }
    
    @objc
    func cancelButtonTapped() {
        viewModel?.dismissPokemonSelection()
    }
}

extension IntroTextView {
    func animateMessage(message: String) {
        DispatchQueue.main.async {
            self.nextButton.isEnabled = false
            var currentIndex = 0
            let introMessage = message
            self.messageLabel.text = ""
            
            let interval = TimeInterval(3.0) / Double(introMessage.count)
            
            self.animationTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] timer in
                guard let self = self else { return }
                guard currentIndex < introMessage.count else {
                    timer.invalidate()
                    self.nextButton.isEnabled = true
                    return
                }
                
                let index = introMessage.index(introMessage.startIndex, offsetBy: currentIndex)
                self.messageLabel.text?.append(introMessage[index])
                currentIndex += 1
            }
        }
    }
    
    
}
