//
//  BattleViewController.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/22/25.
//

import Foundation
import UIKit

class BattleViewController: UIViewController {
    weak var coordinator: BattleCoordinator?
    
    var viewModel: BattleViewModel
    
    private var loadingView: LoadingView!
    private var safeArea: UILayoutGuide!
    
    init(viewModel: BattleViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        loadingView = LoadingView()
        self.viewModel.controller = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.safeArea = self.view.layoutMarginsGuide
        
        self.loadingView.displayLoadingView(with: "Loading Pokemon Battle", on: self.view)
    }
}
