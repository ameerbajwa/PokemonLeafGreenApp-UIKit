//
//  PokemonBattleMoveListView.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/28/25.
//

import Foundation
import UIKit
import Combine

class PokemonBattleMoveListView: UIView {    
    var moveListView: UIView!
    var moveListTableView: UITableView!
    
    func setupMoveListView() {
        moveListView = UIView()
        moveListView.layer.cornerRadius = 5
        moveListView.layer.borderWidth = 5
        moveListView.layer.borderColor = UIColor.black.cgColor
        
        moveListTableView = UITableView()
        moveListTableView.dataSource = self
        moveListTableView.delegate = self
        moveListTableView.register(PokemonBattleMoveListCellView.self, forCellReuseIdentifier: PokemonBattleMoveListCellView.identifier)
        
        self.addSubview(moveListView)
        moveListView.addSubview(moveListTableView)
        moveListView.translatesAutoresizingMaskIntoConstraints = false
        moveListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moveListView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            moveListView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            moveListView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0),
            moveListView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0),
            
            moveListTableView.topAnchor.constraint(equalTo: moveListView.topAnchor, constant: 10.0),
            moveListTableView.leadingAnchor.constraint(equalTo: moveListView.leadingAnchor, constant: 10.0),
            moveListTableView.trailingAnchor.constraint(equalTo: moveListView.trailingAnchor, constant: -10.0),
            moveListTableView.bottomAnchor.constraint(equalTo: moveListView.bottomAnchor, constant: -10.0)
        ])
    }
}

extension PokemonBattleMoveListView: UITableViewDelegate {
    
}

extension PokemonBattleMoveListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonBattleMoveListCellView.identifier, for: indexPath) as? PokemonBattleMoveListCellView else {
            return UITableViewCell()
        }
        
        
        return cell
    }
}
