//
//  PokemonBattleActionMoveListView.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/28/25.
//

import Foundation
import UIKit
import Combine

class PokemonBattleActionMoveListView: UIView {
    var moveListTableView: UITableView!
    
    func setupMoveListView() {
        moveListTableView = UITableView()
        moveListTableView.dataSource = self
        moveListTableView.delegate = self
        moveListTableView.register(PokemonBattleActionMoveListCellView.self, forCellReuseIdentifier: PokemonBattleActionMoveListCellView.identifier)
        
        self.addSubview(moveListTableView)
        moveListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moveListTableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            moveListTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            moveListTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0),
            moveListTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0)
        ])
    }
}

extension PokemonBattleActionMoveListView: UITableViewDelegate {
    
}

extension PokemonBattleActionMoveListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonBattleActionMoveListCellView.identifier, for: indexPath) as? PokemonBattleActionMoveListCellView else {
            return UITableViewCell()
        }
        
        
        return cell
    }
}
