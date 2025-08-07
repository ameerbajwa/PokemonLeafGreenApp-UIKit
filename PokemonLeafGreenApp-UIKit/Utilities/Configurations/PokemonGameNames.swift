//
//  PokemonGameNames.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/14/25.
//

public enum PokemonGameLocations: String {
    case palletTown = "Pallet Town"
    case route1 = "Route 1"
    case virdianCity = "Virdian City"
    case route22 = "Route 22"
    case virdianForest = "Virdian Forest"
    case pewterCity = "Pewter City"
    case route3 = "Route 3"
    case mtMoon = "Mt. Moon"
    case route4 = "Route 4"
    case ceruleanCity = "Cerulean City"
}

public enum PokemonIdNameConfiguration {
    case bulbasaur
    case ivysaur
    case venusaur
    case charmander
    case charmeleon
    case charizard
    case squirtle
    case wartortle
    case blastoise
    case caterpie
    case metapod
    case butterfree
    case weedle
    case kakuna
    case beedrill
    case pidgey
    case pidgeotto
    case pidgeot
    case rattata
    case raticate
    case spearow
    case fearow
    case ekans
    case arbok
    case pikachu
    case raichu
    case sandshrew
    case sandslash
    case nidoranf
    case nidorina
    case nidoqueen
    case nidoranm
    
    var name: String {
        switch self {
        case .bulbasaur:
            return "bulbasaur"
        case .ivysaur:
            return "ivysaur"
        case .venusaur:
            return "venusaur"
        case .charmander:
            return "charmander"
        case .charmeleon:
            return "charmeleon"
        case .charizard:
            return "charizard"
        case .squirtle:
            return "squirtle"
        case .wartortle:
            return "wartortle"
        case .blastoise:
            return "blastoise"
        case .caterpie:
            return "caterpie"
        case .metapod:
            return "metapod"
        case .butterfree:
            return "butterfree"
        case .weedle:
            return "weedle"
        case .kakuna:
            return "kakuna"
        case .beedrill:
            return "beedrill"
        case .pidgey:
            return "pidgey"
        case .pidgeotto:
            return "pidgeotto"
        case .pidgeot:
            return "pidgeot"
        case .rattata:
            return "rattata"
        case .raticate:
            return "raticate"
        case .spearow:
            return "spearow"
        case .fearow:
            return "fearow"
        case .ekans:
            return "ekans"
        case .arbok:
            return "arbok"
        case .pikachu:
            return "pikachu"
        case .raichu:
            return "raichu"
        case .sandshrew:
            return "sandshrew"
        case .sandslash:
            return "sandslash"
        case .nidoranf:
            return "nidoran-f"
        case .nidorina:
            return "nidorina"
        case .nidoqueen:
            return "nidoqueen"
        case .nidoranm:
            return "nidoran-m"
        }
    }
    
    var id: Int {
        switch self {
        case .bulbasaur:
            return 1
        case .ivysaur:
            return 2
        case .venusaur:
            return 3
        case .charmander:
            return 4
        case .charmeleon:
            return 5
        case .charizard:
            return 6
        case .squirtle:
            return 7
        case .wartortle:
            return 8
        case .blastoise:
            return 9
        case .caterpie:
            return 10
        case .metapod:
            return 11
        case .butterfree:
            return 12
        case .weedle:
            return 13
        case .kakuna:
            return 14
        case .beedrill:
            return 15
        case .pidgey:
            return 16
        case .pidgeotto:
            return 17
        case .pidgeot:
            return 18
        case .rattata:
            return 19
        case .raticate:
            return 20
        case .spearow:
            return 21
        case .fearow:
            return 22
        case .ekans:
            return 23
        case .arbok:
            return 24
        case .pikachu:
            return 25
        case .raichu:
            return 26
        case .sandshrew:
            return 27
        case .sandslash:
            return 28
        case .nidoranf:
            return 29
        case .nidorina:
            return 30
        case .nidoqueen:
            return 31
        case .nidoranm:
            return 32
        }
    }
}
