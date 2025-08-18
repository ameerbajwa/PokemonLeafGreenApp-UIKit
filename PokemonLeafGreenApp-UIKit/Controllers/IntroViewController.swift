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
    
    var dataManager: PokemonDataManager
    var introViewModel: IntroViewModel
    var introView: IntroView
    
    private var loadingView: LoadingView!
    private var safeArea: UILayoutGuide!
    
    init(dataManager: PokemonDataManager, introViewModel: IntroViewModel, introView: IntroView) {
        self.dataManager = dataManager
        self.introViewModel = introViewModel
        self.introView = introView
        
        super.init(nibName: nil, bundle: nil)
        loadingView = LoadingView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.safeArea = self.view.layoutMarginsGuide
        
        self.loadingView.displayLoadingView(with: "Loading Intro", on: self.view)
        
        Task {
            try await dataManager.checkAndStorePokemonInfo()
            await setupViewController()
            
            self.loadingView.dismissLoadingView()
            introViewModel.displayNextMessage()
        }
    }
}

extension IntroViewController {
    func setupViewController() async {
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
    }
}
