//
//  PokemonBattleMoveListCellView.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/28/25.
//

import Foundation
import UIKit
import Combine

class PokemonBattleMoveListCellView: UITableViewCell {
    static let identifier = "PokemonBattleMoveTableViewCell"
    
    var nameLabel: UILabel!
    var typeLabel: UILabel!
    var ppLabel: UILabel!
    
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
        
        typeLabel = UILabel()
        typeLabel.font = .systemFont(ofSize: 12.0)
        typeLabel.textColor = .systemGray
        typeLabel.textAlignment = .left
        
        ppLabel = UILabel()
        ppLabel.font = .systemFont(ofSize: 14.0)
        ppLabel.textColor = .gray
        ppLabel.textAlignment = .center
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(typeLabel)
        contentView.addSubview(ppLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        ppLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0),
            nameLabel.widthAnchor.constraint(equalToConstant: 100.0),
            
            typeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            typeLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 15.0),
            typeLabel.widthAnchor.constraint(equalToConstant: 50.0),
            
            ppLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ppLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15.0),
            ppLabel.widthAnchor.constraint(equalToConstant: 40.0)
        ])
    }
    
    func configure(with pokemonMoveInfo: PokemonBattleMoveInfo) {
        nameLabel.text = pokemonMoveInfo.moveInfo.name
        typeLabel.text = pokemonMoveInfo.moveInfo.moveType
        ppLabel.text = "\(pokemonMoveInfo.currentPP)/\(pokemonMoveInfo.moveInfo.pp)"
    }
}
