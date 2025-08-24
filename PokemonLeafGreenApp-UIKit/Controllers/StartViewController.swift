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

        viewModel.startController = self
        startView.viewModel = viewModel
        
        self.view.addSubview(startView)
        startView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            startView.topAnchor.constraint(equalTo: self.safeArea.topAnchor),
            startView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor),
            startView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor),
            startView.bottomAnchor.constraint(equalTo: self.safeArea.bottomAnchor)
        ])
        
        viewModel.startView.setupViews()
        viewModel.startView.setUpImages()
        
        viewModel.animateScreen()
    }
}

extension StartViewController {
    func coordinateToIntroScreen() {
        coordinator?.finish(configuration: nil)
    }
}
