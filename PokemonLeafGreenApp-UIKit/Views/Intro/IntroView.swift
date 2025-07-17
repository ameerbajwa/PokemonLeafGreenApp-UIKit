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
    
    var bulbasaurImageButton: UIButton!
    var charmanderImageButton: UIButton!
    var squirtleImageButton: UIButton!
    
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
    
    func setupImageViewsandButtons() {
        bulbasaurImageButton = UIButton()
        charmanderImageButton = UIButton()
        squirtleImageButton = UIButton()
    }
}
