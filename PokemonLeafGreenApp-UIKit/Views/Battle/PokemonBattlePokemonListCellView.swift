//
//  PokemonBattlePokemonListCellView.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/28/25.
//

import Foundation
import UIKit
import Combine

class PokemonBattlePokemonListCellView: UITableViewCell {
    static let identifier = "PokemonBattlePokemonTableCellView"
    
    var nameLabel: UILabel!
    var hpLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabels() {
        nameLabel = UILabel()
        nameLabel.font = .boldSystemFont(ofSize: 16.0)
        nameLabel.textAlignment = .left
        nameLabel.textColor = .black
        
        hpLabel = UILabel()
        hpLabel.font = .systemFont(ofSize: 14.0)
        hpLabel.textColor = .gray
        hpLabel.textAlignment = .center
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(hpLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        hpLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0),
            nameLabel.widthAnchor.constraint(equalToConstant: 100.0),
            
            hpLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            hpLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15.0),
            hpLabel.widthAnchor.constraint(equalToConstant: 40.0)
        ])
    }
    
    func configure(with pokemonMoveInfo: PokemonBattleMoveInfo) {
        nameLabel.text = pokemonMoveInfo.moveInfo.name
        hpLabel.text = "\(pokemonMoveInfo.currentPP)/\(pokemonMoveInfo.moveInfo.pp)"
    }
}
