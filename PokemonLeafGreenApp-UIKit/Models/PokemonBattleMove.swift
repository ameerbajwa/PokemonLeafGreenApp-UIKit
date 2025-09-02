//
//  PokemonBattleMove.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/28/25.
//

struct PokemonBattleMoveInfo {
    let moveInfo: CoreDataMove
    var currentPP: Int
    
    init(moveInfo: CoreDataMove, currentPP: Int) {
        self.moveInfo = moveInfo
        self.currentPP = Int(moveInfo.pp)
    }
}
