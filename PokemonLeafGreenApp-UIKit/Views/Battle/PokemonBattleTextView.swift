//
//  PokemonBattleTextView.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/24/25.
//

import Foundation
import UIKit

class PokemonBattleTextView: UIView {
    var pokemonBattleText: UILabel!
    
    func setupPokemonBattleText() {
        pokemonBattleText = UILabel()
        pokemonBattleText.font = UIFont.systemFont(ofSize: 14.0)
    }
}
