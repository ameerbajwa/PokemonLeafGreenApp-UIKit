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
        
        introView.viewModel = introViewModel
        
        self.view.addSubview(self.introView)
        introView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            introView.topAnchor.constraint(equalTo: self.safeArea.topAnchor),
            introView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor),
            introView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor),
            introView.bottomAnchor.constraint(equalTo: self.safeArea.bottomAnchor)
        ])
        
        introViewModel.controllerViewFrameSize = self.safeArea.layoutFrame.size
        introViewModel.introView.setupIntroTextView()
        introViewModel.introView.setupPlayerNameTextField()
        introViewModel.introView.introTextView.setupIntroLabelAndNextButton()
        
        Task {
            if let pokemonConfigurations = introViewModel.pokemonLocationConfiguration.pokemonConfigurations {
                for pokemonConfiguration in pokemonConfigurations {
                    print(pokemonConfiguration.name)
                    let pokemonMoves = try await introViewModel.storePokemonInCoreData(pokemonConfiguration: pokemonConfiguration)
                    if pokemonMoves.count > 0 {
                        for pokemonMove in pokemonMoves {
                            print(pokemonMove.name)
                            try await introViewModel.checkCoreDataMoveObject(pokemonMove: pokemonMove)
                        }
                    }
                }
            }
            
            print("DisplayNextMessage called now")
            introViewModel.displayNextMessage()
        }
    }
}
