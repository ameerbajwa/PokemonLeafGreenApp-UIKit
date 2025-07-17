//
//  IntroViewController.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/12/25.
//

import Foundation
import UIKit

class IntroViewController: UIViewController {
    weak var coordinator: ChildCoordinator?
    
    var introViewModel: IntroViewModel
    var introView: IntroView
    
    private var safeArea: UILayoutGuide!
    
    init(introViewModel: IntroViewModel, introView: IntroView) {
        self.introViewModel = introViewModel
        self.introView = introView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.safeArea = self.view.layoutMarginsGuide
        
        self.view.addSubview(self.introView)
        introView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            introView.topAnchor.constraint(equalTo: self.safeArea.topAnchor),
            introView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor),
            introView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor),
            introView.bottomAnchor.constraint(equalTo: self.safeArea.bottomAnchor)
        ])
        
        introViewModel.introView.introTextView.setupIntroLabelAndNextButton()
        introViewModel.introView.setupIntroTextView()
        
        introViewModel.displayNextMessage()
    }
}
