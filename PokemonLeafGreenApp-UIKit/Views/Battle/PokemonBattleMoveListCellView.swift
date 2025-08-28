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
    
    var moveNameLabel: UILabel!
    var moveTypeLabel: UILabel!
    var ppLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabels() {
        moveNameLabel = UILabel()
        moveNameLabel.font = .boldSystemFont(ofSize: 16.0)
        moveNameLabel.textAlignment = .left
        moveNameLabel.textColor = .black
        
        moveTypeLabel = UILabel()
        moveTypeLabel.font = .systemFont(ofSize: 12.0)
        moveTypeLabel.textColor = .systemGray
        moveTypeLabel.textAlignment = .left
        
        ppLabel = UILabel()
        ppLabel.font = .systemFont(ofSize: 14.0)
        ppLabel.textColor = .gray
        ppLabel.textAlignment = .center
        
        contentView.addSubview(moveNameLabel)
        contentView.addSubview(moveTypeLabel)
        contentView.addSubview(ppLabel)
        moveNameLabel.translatesAutoresizingMaskIntoConstraints = false
        moveTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        ppLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moveNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            moveNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0),
            moveNameLabel.widthAnchor.constraint(equalToConstant: 100.0),
            
            moveTypeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            moveTypeLabel.leadingAnchor.constraint(equalTo: moveNameLabel.trailingAnchor, constant: 15.0),
            moveTypeLabel.widthAnchor.constraint(equalToConstant: 50.0),
            
            ppLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ppLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15.0),
            ppLabel.widthAnchor.constraint(equalToConstant: 40.0)
        ])
    }
}
