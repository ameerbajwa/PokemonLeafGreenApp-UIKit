//
//  StartViewController.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/2/25.
//

import Foundation
import UIKit

class StartViewController: UIViewController {
    weak var coordinator: BaseCoordinator?
    var pokeAPINetworkService: PokeAPINetworkService
    var coreDataNetworkService: CoreDataNetworkService
    
    private var safeArea: UILayoutGuide!
    private var titleLabel: UILabel!
    private var animationTimer: Timer?
    
    init(pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService) {
        self.pokeAPINetworkService = pokeAPINetworkService
        self.coreDataNetworkService = coreDataNetworkService
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = .white
        self.safeArea = self.view.layoutMarginsGuide
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupViews()
        animateTitle()
    }
    
    func setupViews() {
        titleLabel = UILabel()
        titleLabel.font = .boldSystemFont(ofSize: 30)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        let newGameButton = UIButton()
        newGameButton.setTitle("New Game", for: .normal)
        newGameButton.setTitleColor(.black, for: .normal)
        newGameButton.titleLabel?.font = .boldSystemFont(ofSize: 16.0)
        newGameButton.layer.borderWidth = 5.0
        newGameButton.layer.borderColor = UIColor.black.cgColor
        
        let loadGameButton = UIButton()
        loadGameButton.setTitle("Load Game", for: .normal)
        loadGameButton.setTitleColor(.black, for: .normal)
        loadGameButton.titleLabel?.font = .boldSystemFont(ofSize: 16.0)
        loadGameButton.layer.borderWidth = 5.0
        loadGameButton.layer.borderColor = UIColor.black.cgColor
        
        let buttonStackView = UIStackView(arrangedSubviews: [newGameButton, loadGameButton])
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 30.0
        buttonStackView.distribution = .fillEqually
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.view.addSubview(self.titleLabel)
            self.view.addSubview(buttonStackView)
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            buttonStackView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                self.titleLabel.topAnchor.constraint(equalTo: self.safeArea.topAnchor, constant: 30.0),
                self.titleLabel.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor, constant: 30.0),
                self.titleLabel.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor, constant: -30.0),
                
                buttonStackView.centerXAnchor.constraint(equalTo: self.safeArea.centerXAnchor),
                buttonStackView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 75.0),
                buttonStackView.widthAnchor.constraint(equalToConstant: 150.0)
            ])
        }
    }
    
    func animateTitle() {
        var currentIndex = 0
        let titleMessage = "Pokemon LeafGreen Game App"
        titleLabel.text = ""
        
        let interval = TimeInterval(3.0) / Double(titleMessage.count)
        
        animationTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            guard currentIndex < titleMessage.count else {
                timer.invalidate()
                return
            }
            
            let index = titleMessage.index(titleMessage.startIndex, offsetBy: currentIndex)
            titleLabel.text?.append(titleMessage[index])
            currentIndex += 1
        }
    }
}
