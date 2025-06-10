//
//  BasicPokemon.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/9/25.
//

import Foundation

class BasicPokemon: Decodable {
    let id: Int
    let name: String
    let baseExperience: Int
    let moves: [BasicPokemonMoves]
    let sprites: BasicPokemonSpritesVersion
    let stats: [BasicPokemonStatDetails]
    let types: [BasicPokemonType]
    
    private enum BasicPokemonKeys: String, CodingKey {
        case id, name, moves, sprites, stats, types
        case baseExperience = "base_experience"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BasicPokemonKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.baseExperience = try container.decode(Int.self, forKey: .baseExperience)
        self.moves = try container.decode([BasicPokemonMoves].self, forKey: .moves)
        self.sprites = try container.decode(BasicPokemonSpritesVersion.self, forKey: .sprites)
        self.stats = try container.decode([BasicPokemonStatDetails].self, forKey: .stats)
        self.types = try container.decode([BasicPokemonType].self, forKey: .types)
    }
}

class BasicPokemonMoves: Decodable {
    let move: BasicPokemonNameURLStructure
    let versionGroupDetails: [BasicPokemonVersionGroupDetails]
    
    private enum BasicPokemonMovesKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BasicPokemonMovesKeys.self)
        self.move = try container.decode(BasicPokemonNameURLStructure.self, forKey: .move)
        self.versionGroupDetails = try container.decode([BasicPokemonVersionGroupDetails].self, forKey: .versionGroupDetails)
    }
}

class BasicPokemonVersionGroupDetails: Decodable {
    let levelLearnedAt: Int
    let versionGroup: BasicPokemonNameURLStructure
    
    private enum BasicPokemonVersionGroupDetailsKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case versionGroup
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BasicPokemonVersionGroupDetailsKeys.self)
        self.levelLearnedAt = try container.decode(Int.self, forKey: .levelLearnedAt)
        self.versionGroup = try container.decode(BasicPokemonNameURLStructure.self, forKey: .versionGroup)
    }
}

class BasicPokemonSpritesVersion: Decodable {
    let generationIII: BasicPokemonSpritesGenerationIII
    
    private enum BasicPokemonSpritesVersionKeys: String, CodingKey {
        case generationIII = "generation-iii"
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: BasicPokemonSpritesVersionKeys.self)
        self.generationIII = try container.decode(BasicPokemonSpritesGenerationIII.self, forKey: .generationIII)
    }
}

class BasicPokemonSpritesGenerationIII: Decodable {
    let fireRedLeafGreen: BasicPokemonSpritesVersionLeafGreen
    
    private enum BasicPokemonSpritesGenerationIIIKeys: String, CodingKey {
        case fireRedLeafGreen = "firered-leafgreen"
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: BasicPokemonSpritesGenerationIIIKeys.self)
        self.fireRedLeafGreen = try container.decode(BasicPokemonSpritesVersionLeafGreen.self, forKey: .fireRedLeafGreen)
    }
}

class BasicPokemonSpritesVersionLeafGreen: Decodable {
    let frontImageUrl: String
    let backImageUrl: String
    
    private enum BasicPokemonSpritesVersionLeafGreenKeys: String, CodingKey {
        case frontImageUrl = "front_default"
        case backImageUrl = "back_default"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BasicPokemonSpritesVersionLeafGreenKeys.self)
        self.frontImageUrl = try container.decode(String.self, forKey: .frontImageUrl)
        self.backImageUrl = try container.decode(String.self, forKey: .backImageUrl)
    }
}

class BasicPokemonStatDetails: Decodable {
    let basicStat: Int
    let effort: Int
    let basicStatName: BasicPokemonNameURLStructure
    
    private enum BasicPokemonStatDetailsKeys: String, CodingKey {
        case basicStat = "basic_stat"
        case effort
        case basicStatName = "stat"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BasicPokemonStatDetailsKeys.self)
        self.basicStat = try container.decode(Int.self, forKey: .basicStat)
        self.effort = try container.decode(Int.self, forKey: .effort)
        self.basicStatName = try container.decode(BasicPokemonNameURLStructure.self, forKey: .basicStatName)
    }
}

class BasicPokemonType: Decodable {
    let types: [BasicPokemonNameURLStructure]
    
    private enum BasicPokemonTypeKey: String, CodingKey {
        case types = "type"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BasicPokemonTypeKey.self)
        self.types = try container.decode([BasicPokemonNameURLStructure].self, forKey: .types)
    }
}

class BasicPokemonNameURLStructure: Decodable {
    let name: String
    let url: String
    
    private enum BasicPokemonNameURLStructureKeys: String, CodingKey {
        case name, url
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BasicPokemonNameURLStructureKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.url = try container.decode(String.self, forKey: .url)
    }
}

class BasicPokemonURLStructure: Decodable {
    let url: String
    
    private enum BasicPokemonURLStructureKey: String, CodingKey {
        case url
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BasicPokemonURLStructureKey.self)
        self.url = try container.decode(String.self, forKey: .url)
    }
}

class BasicPokemonSpeciesDetails: Decodable {
    let id: Int
    let name: String
    let growthRate: String
    let evolutionChain: BasicPokemonURLStructure
    let descriptionDetails: [BasicPokemonDescriptionDetails]
    
    private enum BasicPokemonSpeciesDetailsKeys: String, CodingKey {
        case id, name
        case growthRate = "growth_rate"
        case evolutionChain = "evolution_chain"
        case descriptionDetails = "flavored_text_entries"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BasicPokemonSpeciesDetailsKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.growthRate = try container.decode(String.self, forKey: .growthRate)
        self.evolutionChain = try container.decode(BasicPokemonURLStructure.self, forKey: .evolutionChain)
        self.descriptionDetails = try container.decode([BasicPokemonDescriptionDetails].self, forKey: .descriptionDetails)
    }
}

class BasicPokemonDescriptionDetails: Decodable {
    let description: String
    let language: BasicPokemonNameURLStructure
    let version: BasicPokemonNameURLStructure
    
    private enum BasicPokemonDescriptionDetailsKeys: String, CodingKey {
        case description = "flavor_text"
        case language, version
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BasicPokemonDescriptionDetailsKeys.self)
        self.description = try container.decode(String.self, forKey: .description)
        self.language = try container.decode(BasicPokemonNameURLStructure.self, forKey: .language)
        self.version = try container.decode(BasicPokemonNameURLStructure.self, forKey: .version)
    }
}
