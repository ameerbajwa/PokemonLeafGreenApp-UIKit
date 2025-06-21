//
//  PokeAPIPokemon.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/9/25.
//

import Foundation

class PokeAPIPokemonDetails: PokeAPIBaseStructure {
    let baseExperience: Int
    let moves: [PokeAPIPokemonMoveDetails]
    let sprites: PokeAPIPokemonSpritesDetails
    let stats: [PokeAPIPokemonStatDetails]
    let types: [PokeAPIPokemonTypeDetails]
    
    private enum PokeAPIPokemonDetailsKeys: String, CodingKey {
        case moves, sprites, stats, types
        case baseExperience = "base_experience"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonDetailsKeys.self)
        self.baseExperience = try container.decode(Int.self, forKey: .baseExperience)
        self.moves = try container.decode([PokeAPIPokemonMoveDetails].self, forKey: .moves)
        self.sprites = try container.decode(PokeAPIPokemonSpritesDetails.self, forKey: .sprites)
        self.stats = try container.decode([PokeAPIPokemonStatDetails].self, forKey: .stats)
        self.types = try container.decode([PokeAPIPokemonTypeDetails].self, forKey: .types)
        try super.init(from: decoder)
    }
}

class PokeAPIPokemonMoveDetails: Decodable {
    var move: PokeAPIPokemonNameURLStructure
    var versionGroupDetails: [PokeAPIPokemonMoveVersionGroupDetails]
    
    init(move: PokeAPIPokemonNameURLStructure, versionGroupDetails: [PokeAPIPokemonMoveVersionGroupDetails]) {
        self.move = move
        self.versionGroupDetails = versionGroupDetails
    }
    
    private enum PokeAPIPokemonMoveDetailsKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonMoveDetailsKeys.self)
        self.move = try container.decode(PokeAPIPokemonNameURLStructure.self, forKey: .move)
        self.versionGroupDetails = try container.decode([PokeAPIPokemonMoveVersionGroupDetails].self, forKey: .versionGroupDetails)
    }
}

class PokeAPIPokemonMoveVersionGroupDetails: Decodable {
    let levelLearnedAt: Int
    let moveLearnMethod: PokeAPIPokemonNameURLStructure
    let versionGroup: PokeAPIPokemonNameURLStructure
    
    private enum PokeAPIPokemonMoveVersionGroupDetailsKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonMoveVersionGroupDetailsKeys.self)
        self.levelLearnedAt = try container.decode(Int.self, forKey: .levelLearnedAt)
        self.moveLearnMethod = try container.decode(PokeAPIPokemonNameURLStructure.self, forKey: .moveLearnMethod)
        self.versionGroup = try container.decode(PokeAPIPokemonNameURLStructure.self, forKey: .versionGroup)
    }
}

class PokeAPIPokemonSpritesDetails: Decodable {
    let versions: PokeAPIPokemonSpritesVersionsDetails
    
    private enum PokeAPIPokemonSpritesDetailsKeys: String, CodingKey {
        case versions
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonSpritesDetailsKeys.self)
        self.versions = try container.decode(PokeAPIPokemonSpritesVersionsDetails.self, forKey: .versions)
        
    }
}

class PokeAPIPokemonSpritesVersionsDetails: Decodable {
    let generationIII: PokeAPIPokemonSpritesVersionGenerationIIIDetails

    private enum PokeAPIPokemonSpritesVersionsDetailsKey: String, CodingKey {
        case generationIII = "generation-iii"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonSpritesVersionsDetailsKey.self)
        self.generationIII = try container.decode(PokeAPIPokemonSpritesVersionGenerationIIIDetails.self, forKey: .generationIII)
    }
}

class PokeAPIPokemonSpritesVersionGenerationIIIDetails: Decodable {
    let leafGreen: PokeAPIPokemonSpritesVersionLeafGreenDetails
    
    private enum PokeAPIPokemonSpritesVersionGenerationIIIDetailsKeys: String, CodingKey {
        case leafGreen = "firered-leafgreen"
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonSpritesVersionGenerationIIIDetailsKeys.self)
        self.leafGreen = try container.decode(PokeAPIPokemonSpritesVersionLeafGreenDetails.self, forKey: .leafGreen)
    }
}

class PokeAPIPokemonSpritesVersionLeafGreenDetails: Decodable {
    let frontImageUrl: String
    let backImageUrl: String
    
    private enum PokeAPIPokemonSpritesVersionLeafGreenDetailsKeys: String, CodingKey {
        case frontImageUrl = "front_default"
        case backImageUrl = "back_default"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonSpritesVersionLeafGreenDetailsKeys.self)
        self.frontImageUrl = try container.decode(String.self, forKey: .frontImageUrl)
        self.backImageUrl = try container.decode(String.self, forKey: .backImageUrl)
    }
}

class PokeAPIPokemonStatDetails: Decodable {
    let baseStat: Int
    let effort: Int
    let stat: PokeAPIPokemonNameURLStructure
    
    private enum PokeAPIPokemonStatDetailsKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonStatDetailsKeys.self)
        self.baseStat = try container.decode(Int.self, forKey: .baseStat)
        self.effort = try container.decode(Int.self, forKey: .effort)
        self.stat = try container.decode(PokeAPIPokemonNameURLStructure.self, forKey: .stat)
    }
}

class PokeAPIPokemonTypeDetails: Decodable {
    let typeDetails: PokeAPIPokemonNameURLStructure
    
    private enum PokeAPIPokemonTypeDetailsKey: String, CodingKey {
        case typeDetails = "type"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonTypeDetailsKey.self)
        self.typeDetails = try container.decode(PokeAPIPokemonNameURLStructure.self, forKey: .typeDetails)
    }
}

class PokeAPIPokemonSpeciesDetails: PokeAPIBaseStructure {
    let growthRate: PokeAPIPokemonNameURLStructure
    let evolutionChain: PokeAPIPokemonURLStructure
    let descriptionDetails: [PokeAPIPokemonSpeciesDescriptionDetails]
    
    private enum PokeAPIPokemonSpeciesDetailsKeys: String, CodingKey {
        case growthRate = "growth_rate"
        case evolutionChain = "evolution_chain"
        case descriptionDetails = "flavor_text_entries"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonSpeciesDetailsKeys.self)
        self.growthRate = try container.decode(PokeAPIPokemonNameURLStructure.self, forKey: .growthRate)
        self.evolutionChain = try container.decode(PokeAPIPokemonURLStructure.self, forKey: .evolutionChain)
        self.descriptionDetails = try container.decode([PokeAPIPokemonSpeciesDescriptionDetails].self, forKey: .descriptionDetails)
        try super.init(from: decoder)
    }
}

class PokeAPIMoveDetails: PokeAPIBaseStructure {
    let accuracy: Int
    let power: Int?
    let pp: Int
    let moveType: PokeAPIPokemonNameURLStructure
    let moveDescription: [PokeAPIPokemonMoveDescriptionDetails]
    let statChanges: [PokeAPIMoveStatChangeDetails]?
    
    private enum PokeAPIMoveDetailsKeys: String, CodingKey {
        case accuracy, power, pp
        case moveType = "type"
        case moveDescription = "flavor_text_entries"
        case statChanges = "stat_changes"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIMoveDetailsKeys.self)
        self.accuracy = try container.decode(Int.self, forKey: .accuracy)
        self.power = try container.decode(Int.self, forKey: .power)
        self.pp = try container.decode(Int.self, forKey: .pp)
        self.moveType = try container.decode(PokeAPIPokemonNameURLStructure.self, forKey: .moveType)
        self.moveDescription = try container.decode([PokeAPIPokemonMoveDescriptionDetails].self, forKey: .moveDescription)
        self.statChanges = try container.decodeIfPresent([PokeAPIMoveStatChangeDetails].self, forKey: .statChanges)
        try super.init(from: decoder)
    }
}

class PokeAPIMoveStatChangeDetails: Decodable {
    let change: Int
    let stat: PokeAPIPokemonNameURLStructure
    
    private enum PokeAPIMoveStatChangeDetailsKeys: String, CodingKey {
        case change, stat
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIMoveStatChangeDetailsKeys.self)
        self.change = try container.decode(Int.self, forKey: .change)
        self.stat = try container.decode(PokeAPIPokemonNameURLStructure.self, forKey: .stat)
    }
}
