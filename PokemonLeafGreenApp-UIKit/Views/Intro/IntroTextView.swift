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
    
    var introLabel: UILabel!
    var nextButton: UIButton!
    
    private var animationTimer: Timer?
    
    func setupIntroLabelAndNextButton() {
        introLabel = UILabel()
        introLabel.font = .systemFont(ofSize: 16)
        introLabel.numberOfLines = 0
        introLabel.textAlignment = .left
        introLabel.textColor = .black
        
        nextButton = UIButton()
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.titleLabel?.font = .boldSystemFont(ofSize: 18.0)
        nextButton.layer.borderColor = UIColor.black.cgColor
        nextButton.layer.cornerRadius = 5.0
        nextButton.layer.borderWidth = 5.0
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        self.addSubview(introLabel)
        self.addSubview(nextButton)
        introLabel.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            introLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            introLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            introLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0),
            
            nextButton.topAnchor.constraint(equalTo: self.introLabel.bottomAnchor, constant: 10.0),
            nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 100.0),
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0)
        ])
    }
}

extension IntroTextView {
    @objc
    func nextButtonTapped() {
        viewModel?.displayNextMessage()
    }
}

extension IntroTextView {
    func animateIntroMessage(message: String) {
        DispatchQueue.main.async {
            var currentIndex = 0
            let introMessage = message
            self.introLabel.text = ""
            
            let interval = TimeInterval(2.0) / Double(introMessage.count)
            
            self.animationTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] timer in
                guard let self = self else { return }
                guard currentIndex < introMessage.count else {
                    timer.invalidate()
                    return
                }
                
                let index = introMessage.index(introMessage.startIndex, offsetBy: currentIndex)
                self.introLabel.text?.append(introMessage[index])
                currentIndex += 1
            }
        }
        
    }
}
