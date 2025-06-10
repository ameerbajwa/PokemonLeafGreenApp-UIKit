//
//  PokeAPICommon.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/10/25.
//

class PokeAPIPokemonNameURLStructure: Decodable {
    let name: String
    let url: String
    
    private enum PokeAPIPokemonNameURLStructureKeys: String, CodingKey {
        case name, url
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonNameURLStructureKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.url = try container.decode(String.self, forKey: .url)
    }
}

class PokeAPIPokemonURLStructure: Decodable {
    let url: String
    
    private enum PokeAPIPokemonURLStructureKey: String, CodingKey {
        case url
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonURLStructureKey.self)
        self.url = try container.decode(String.self, forKey: .url)
    }
}

class PokeAPIPokemonDescriptionDetails: Decodable {
    let description: String
    let language: PokeAPIPokemonNameURLStructure
    let version: PokeAPIPokemonNameURLStructure
    
    private enum PokeAPIPokemonDescriptionDetailsKeys: String, CodingKey {
        case description = "flavor_text"
        case language, version
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokeAPIPokemonDescriptionDetailsKeys.self)
        self.description = try container.decode(String.self, forKey: .description)
        self.language = try container.decode(PokeAPIPokemonNameURLStructure.self, forKey: .language)
        self.version = try container.decode(PokeAPIPokemonNameURLStructure.self, forKey: .version)
    }
}
