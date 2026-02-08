//
//  IntroViewController.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/12/25.
//

import Foundation
import UIKit

@objc
protocol IntroButtonManaging {
    func nextButtonTapped()
    func cancelButtonTapped()
}

protocol IntroManaging: AnyObject {
    func setIntroMessage(message: String)
    func setNewJourneyMessage(message: String)
    func setPlayerNameView()
    func removePlayerNameView()
    func setStarterPokemonOptionsView()
    func displaySelectedPokemonImage(selectedPokemon: PokemonIdNameConfiguration)
    func displayRivalPokemonImage(rivalPokemon: PokemonIdNameConfiguration)
    func removePokemonImage()
    func coordinateToBattleScreen(opposingBattleConfiguration: PokemonBattleConfiguration)
}

protocol IntroViewManaging: AnyObject, UITextFieldDelegate {
    func setSelectedStarterPokemon(pokemon: PokemonIdNameConfiguration)
}

class IntroViewController: UIViewController {
    weak var coordinator: IntroCoordinator?
    
    var introViewModel: IntroViewModel
    var introView: IntroView
    var introTextView: IntroTextView
    
    private var loadingView: LoadingView!
    private var safeArea: UILayoutGuide!
    
    init(introViewModel: IntroViewModel, introView: IntroView, introTextView: IntroTextView) {
        print("IntroViewController created and stored in memory")
        self.introViewModel = introViewModel
        self.introView = introView
        self.introTextView = introTextView
        
        super.init(nibName: nil, bundle: nil)
        loadingView = LoadingView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("IntroViewController removed from memory")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.safeArea = self.view.layoutMarginsGuide
        
        self.loadingView.displayLoadingView(with: "Loading Intro", on: self.view)
        
        Task {
            try await introViewModel.checkAndStorePokemonInfoFromPokemonLocationConfiguration()
            await setupViewController()
            
            self.loadingView.dismissLoadingView()
            introViewModel.displayNextMessage()
        }
    }
}

extension IntroViewController {
    func setupViewController() async {
        self.view.addSubview(self.introView)
        introView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            introView.topAnchor.constraint(equalTo: self.safeArea.topAnchor),
            introView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor),
            introView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor),
            introView.bottomAnchor.constraint(equalTo: self.safeArea.bottomAnchor)
        ])
        
        introTextView.layer.borderWidth = 3.0
        introTextView.layer.borderColor = UIColor.black.cgColor
        introTextView.layer.cornerRadius = 5.0
        
        introView.addSubview(introTextView)
        introTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            introTextView.bottomAnchor.constraint(equalTo: introView.bottomAnchor, constant: -5.0),
            introTextView.leadingAnchor.constraint(equalTo: introView.leadingAnchor, constant: 5.0),
            introTextView.trailingAnchor.constraint(equalTo: introView.trailingAnchor, constant: -5.0),
            introTextView.heightAnchor.constraint(equalToConstant: 250.0)
        ])
        
        introView.introTextViewTopAnchor = introTextView.topAnchor
        introView.setupPlayerNameTextField()
        introTextView.setupIntroLabelAndNextButton()
    }
}

// MARK: - IntroView Delegate Implementation
extension IntroViewController: IntroViewManaging {
    // MARK: - IntroView TextField Implementation
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.text = ""
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        introViewModel.playerName = textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        introViewModel.playerName = textField.text
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - IntroView Selection Implementation
    func setSelectedStarterPokemon(pokemon: PokemonIdNameConfiguration) {
        introViewModel.playerSelectedPokemon = pokemon
        switch pokemon {
        case .bulbasaur:
            introTextView.messageLabel.text = NewJourneyMessages.chooseBulbasaur
        case .charmander:
            introTextView.messageLabel.text = NewJourneyMessages.chooseCharmander
        case .squirtle:
            introTextView.messageLabel.text = NewJourneyMessages.chooseSquirtle
        default:
            return
        }
    }
}

// MARK: - IntroViewModel display next screen layout with message
extension IntroViewController: IntroManaging {
    func setIntroMessage(message: String) {
        DispatchQueue.main.async {
            self.introTextView.messageLabel.text = message
        }
        
    }
    
    func setNewJourneyMessage(message: String) {
        DispatchQueue.main.async {
            self.introTextView.messageLabel.text = message
        }
    }
    
    func setPlayerNameView() {
        DispatchQueue.main.async {
            self.introView.playerNameTextField.isHidden = false
            self.introView.playerNameTextField.isEnabled = true
        }
        
    }
    
    func removePlayerNameView() {
        DispatchQueue.main.async {
            self.introView.removePlayerNameTextFieldFromView()
        }
        
    }
    
    func setStarterPokemonOptionsView() {
        Task {
            introView.setupStarterPokemonButtons()
            let starterPokemonImageData = await introViewModel.retreiveStarterPokemonImageData()
            guard let bulbasaurImageData = starterPokemonImageData.0,
                    let charmanderImageData = starterPokemonImageData.1,
                    let squirtleImageData = starterPokemonImageData.2 else {
                return
            }
            introView.setUpImagesForStarterPokemonButtons(bulbasaurImageData: bulbasaurImageData, charmanderImageData: charmanderImageData, squirtleImageData: squirtleImageData)
            introTextView.cancelButton.isEnabled = true
        }
    }
    
    func displaySelectedPokemonImage(selectedPokemon: PokemonIdNameConfiguration) {
        DispatchQueue.main.async {
            self.introView.removeStarterPokemonButons()
            self.introView.setupSelectedPokemonImage(pokemon: selectedPokemon)
            self.introTextView.cancelButton.isEnabled = false
        }
        
    }
    
    func displayRivalPokemonImage(rivalPokemon: PokemonIdNameConfiguration) {
        DispatchQueue.main.async {
            self.introView.setupSelectedPokemonImage(pokemon: rivalPokemon)
        }
        
    }
    
    func removePokemonImage() {
        DispatchQueue.main.async {
            self.introView.removeSelectedPokemonImage()
        }
    }
    
    func coordinateToBattleScreen(opposingBattleConfiguration: PokemonBattleConfiguration) {
        coordinator?.finish(configuration: .battle(opposingBattleConfiguration))
    }
}

// MARK: - IntroTextView Button Implementation
extension IntroViewController: IntroButtonManaging {
    func nextButtonTapped() {
        introViewModel.displayNextMessage()
    }
    
    func cancelButtonTapped() {
        introViewModel.dismissPokemonSelection()
    }
}
