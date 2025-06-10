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
    let sprites: PokeAPIPokemonSpritesVersionDetails
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
        self.sprites = try container.decode(PokeAPIPokemonSpritesVersionDetails.self, forKey: .sprites)
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
        case versionGroup
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonVersionGroupDetailsKeys.self)
        self.levelLearnedAt = try container.decode(Int.self, forKey: .levelLearnedAt)
        self.versionGroup = try container.decode(PokeAPIPokemonNameURLStructure.self, forKey: .versionGroup)
    }
}

class PokeAPIPokemonSpritesVersionDetails: Decodable {
    let generationIII: PokeAPIPokemonSpritesGenerationIIIDetails
    
    private enum PokeAPIPokemonSpritesVersionDetailsKeys: String, CodingKey {
        case generationIII = "generation-iii"
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonSpritesVersionDetailsKeys.self)
        self.generationIII = try container.decode(PokeAPIPokemonSpritesGenerationIIIDetails.self, forKey: .generationIII)
    }
}

class PokeAPIPokemonSpritesGenerationIIIDetails: Decodable {
    let fireRedLeafGreen: PokeAPIPokemonSpritesVersionLeafGreenDetails
    
    private enum PokeAPIPokemonSpritesGenerationIIIDetailsKeys: String, CodingKey {
        case fireRedLeafGreen = "firered-leafgreen"
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonSpritesGenerationIIIDetailsKeys.self)
        self.fireRedLeafGreen = try container.decode(PokeAPIPokemonSpritesVersionLeafGreenDetails.self, forKey: .fireRedLeafGreen)
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
    let basicStat: Int
    let effort: Int
    let statName: PokeAPIPokemonNameURLStructure
    
    private enum PokeAPIPokemonStatDetailsKeys: String, CodingKey {
        case basicStat = "basic_stat"
        case effort
        case statName = "stat"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonStatDetailsKeys.self)
        self.basicStat = try container.decode(Int.self, forKey: .basicStat)
        self.effort = try container.decode(Int.self, forKey: .effort)
        self.statName = try container.decode(PokeAPIPokemonNameURLStructure.self, forKey: .statName)
    }
}

class PokeAPIPokemonTypeDetails: Decodable {
    let types: [PokeAPIPokemonNameURLStructure]
    
    private enum PokeAPIPokemonTypeDetailsKey: String, CodingKey {
        case types = "type"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonTypeDetailsKey.self)
        self.types = try container.decode([PokeAPIPokemonNameURLStructure].self, forKey: .types)
    }
}

class PokeAPIPokemonSpeciesDetails: Decodable {
    let id: Int
    let name: String
    let growthRate: String
    let evolutionChain: PokeAPIPokemonURLStructure
    let descriptionDetails: [PokeAPIPokemonDescriptionDetails]
    
    private enum PokeAPIPokemonSpeciesDetailsKeys: String, CodingKey {
        case id, name
        case growthRate = "growth_rate"
        case evolutionChain = "evolution_chain"
        case descriptionDetails = "flavored_text_entries"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonSpeciesDetailsKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.growthRate = try container.decode(String.self, forKey: .growthRate)
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
        case movetype = "type"
        case moveDescription = "flavor_text_entries"
    }
    
    required init(fromd decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIMoveKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.accuracy = try container.decode(Int.self, forKey: .accuracy)
        self.power = try container.decode(Int.self, forKey: .power)
        self.pp = try container.decode(Int.self, forKey: .pp)
        self.moveType = try container.decode(PokeAPIPokemonNameURLStructure.self, forKey: .movetype)
        self.moveDescription = try container.decode([PokeAPIPokemonDescriptionDetails].self, forKey: .moveDescription)
    }
}
