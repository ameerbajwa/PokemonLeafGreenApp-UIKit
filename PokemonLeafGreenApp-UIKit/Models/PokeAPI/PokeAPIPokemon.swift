//
//  PokeAPIPokemon.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/9/25.
//

import Foundation

class PokeAPIPokemonDetails: Decodable {
    let id: Int
    let name: String
    let baseExperience: Int
    let moves: [PokeAPIPokemonMoveDetails]
    let sprites: PokeAPIPokemonSpritesDetails
    let stats: [PokeAPIPokemonStatDetails]
    let types: [PokeAPIPokemonTypeDetails]
    
    private enum PokeAPIPokemonDetailsKeys: String, CodingKey {
        case id, name, moves, sprites, stats, types
        case baseExperience = "base_experience"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonDetailsKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.baseExperience = try container.decode(Int.self, forKey: .baseExperience)
        self.moves = try container.decode([PokeAPIPokemonMoveDetails].self, forKey: .moves)
        self.sprites = try container.decode(PokeAPIPokemonSpritesDetails.self, forKey: .sprites)
        self.stats = try container.decode([PokeAPIPokemonStatDetails].self, forKey: .stats)
        self.types = try container.decode([PokeAPIPokemonTypeDetails].self, forKey: .types)
    }
}

class PokeAPIPokemonMoveDetails: Decodable {
    let move: PokeAPIPokemonNameURLStructure
    let versionGroupDetails: [PokeAPIPokemonVersionGroupDetails]
    
    private enum PokeAPIPokemonMoveDetailsKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonMoveDetailsKeys.self)
        self.move = try container.decode(PokeAPIPokemonNameURLStructure.self, forKey: .move)
        self.versionGroupDetails = try container.decode([PokeAPIPokemonVersionGroupDetails].self, forKey: .versionGroupDetails)
    }
}

class PokeAPIPokemonVersionGroupDetails: Decodable {
    let levelLearnedAt: Int
    let versionGroup: PokeAPIPokemonNameURLStructure
    
    private enum PokeAPIPokemonVersionGroupDetailsKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case versionGroup = "version_group"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonVersionGroupDetailsKeys.self)
        self.levelLearnedAt = try container.decode(Int.self, forKey: .levelLearnedAt)
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

class PokeAPIPokemonSpeciesDetails: Decodable {
    let id: Int
    let name: String
    let growthRate: PokeAPIPokemonNameURLStructure
    let evolutionChain: PokeAPIPokemonURLStructure
    let descriptionDetails: [PokeAPIPokemonDescriptionDetails]
    
    private enum PokeAPIPokemonSpeciesDetailsKeys: String, CodingKey {
        case id, name
        case growthRate = "growth_rate"
        case evolutionChain = "evolution_chain"
        case descriptionDetails = "flavor_text_entries"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonSpeciesDetailsKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.growthRate = try container.decode(PokeAPIPokemonNameURLStructure.self, forKey: .growthRate)
        self.evolutionChain = try container.decode(PokeAPIPokemonURLStructure.self, forKey: .evolutionChain)
        self.descriptionDetails = try container.decode([PokeAPIPokemonDescriptionDetails].self, forKey: .descriptionDetails)
    }
}

class PokeAPIMove: Decodable {
    let id: Int
    let name: String
    let accuracy: Int
    let power: Int
    let pp: Int
    let moveType: PokeAPIPokemonNameURLStructure
    let moveDescription: [PokeAPIPokemonDescriptionDetails]
    
    private enum PokeAPIMoveKeys: String, CodingKey {
        case id, name, accuracy, power, pp
        case moveType = "type"
        case moveDescription = "flavor_text_entries"
    }
    
    required init(fromd decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIMoveKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.accuracy = try container.decode(Int.self, forKey: .accuracy)
        self.power = try container.decode(Int.self, forKey: .power)
        self.pp = try container.decode(Int.self, forKey: .pp)
        self.moveType = try container.decode(PokeAPIPokemonNameURLStructure.self, forKey: .moveType)
        self.moveDescription = try container.decode([PokeAPIPokemonDescriptionDetails].self, forKey: .moveDescription)
    }
}
