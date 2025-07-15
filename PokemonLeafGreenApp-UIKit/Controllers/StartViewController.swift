//
//  StartViewController.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/2/25.
//

import Foundation
import UIKit

class StartViewController: UIViewController {
    weak var coordinator: ChildCoordinator?
    
    var viewModel: StartViewModel
    
    private var safeArea: UILayoutGuide!
    
    init(startViewModel: StartViewModel) {
        self.viewModel = startViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.safeArea = self.view.layoutMarginsGuide

        viewModel.startController = self
        self.view.addSubview(viewModel.startView)
        viewModel.startView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewModel.startView.topAnchor.constraint(equalTo: self.safeArea.topAnchor),
            viewModel.startView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor),
            viewModel.startView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor),
            viewModel.startView.bottomAnchor.constraint(equalTo: self.safeArea.bottomAnchor)
        ])
        
        viewModel.startView.setupViews()
        viewModel.startView.setUpImages()
        
        viewModel.animateScreen()
    }
}

extension StartViewController {
    func coordinateToIntroScreen() {
        coordinator?.finish()
    }
}
