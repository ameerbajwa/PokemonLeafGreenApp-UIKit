//
//  CoreDataPokemonManageable.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/26/25.
//

import Foundation
import CoreData

public protocol CoreDataManageable {
    var id: Int16 { get set }
    var name: String { get set }
}
