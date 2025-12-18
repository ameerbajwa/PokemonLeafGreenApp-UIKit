//
//  StartViewController.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/2/25.
//

import Foundation
import UIKit

@objc
protocol StartViewButtonDelegate {
    func newGameButtonPressed()
    func loadGameButtonPressed()
}

class StartViewController: UIViewController {
    weak var coordinator: ChildCoordinator?
    
    var startView: StartView
    var viewModel: StartViewModel
    
    private var safeArea: UILayoutGuide!
    
    init(startViewModel: StartViewModel, startView: StartView) {
        self.viewModel = startViewModel
        self.startView = startView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.safeArea = self.view.layoutMarginsGuide

        startView.parentViewFrame = self.view.frame
        startView.delegate = self
        
        self.view.addSubview(startView)
        startView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            startView.topAnchor.constraint(equalTo: self.safeArea.topAnchor),
            startView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor),
            startView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor),
            startView.bottomAnchor.constraint(equalTo: self.safeArea.bottomAnchor)
        ])
        
        startView.setupViews()
        setUpImages()
        
        animateScreen()
    }
}

// MARK: - Grab Start Screen Pokemon Images
extension StartViewController {
    func setUpImages() {
        Task {
            let imageData = await viewModel.generatePokemonImages()
            guard let attackerImageData = imageData.0,
                  let defenderImageData = imageData.1 else {
                return
            }
            startView.pokemonAttackerImageView.image = UIImage(data: attackerImageData)
            startView.pokemonDefenderImageView.image = UIImage(data: defenderImageData)
        }
    }
}

// MARK: - Animation chain for StartViewController
extension StartViewController {
    func animateScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.startView.animateTitle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.50) {
            self.startView.animateAttackerImage()
            self.startView.animateDefenderImage()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.75) {
            self.startView.buttonStackView.isHidden = false
        }
    }
}

// MARK: - Button Actions
extension StartViewController: StartViewButtonDelegate {
    @objc
    func newGameButtonPressed() {
        viewModel.startNewGame()
        coordinator?.finish(configuration: nil)
    }
    
    @objc
    func loadGameButtonPressed() {
        viewModel.loadGame()
    }
}
