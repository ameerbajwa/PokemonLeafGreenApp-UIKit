//
//  PokemonLocationConfigurationService.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 1/31/26.
//

public class PokemonLocationConfigurationService {
    init() {}
    
    func createPokemonLocationConfigurationLinkedList() -> PokemonLocationConfigurationDoublyLinkedList {
        let locationConfigurationLinkedList = PokemonLocationConfigurationDoublyLinkedList()
        locationConfigurationLinkedList.appendLocation(configuration: PalletTownConfiguration())
        locationConfigurationLinkedList.appendLocation(configuration: Route1Configuration())
        locationConfigurationLinkedList.appendLocation(configuration: ViridianCityConfiguration())
        locationConfigurationLinkedList.appendLocation(configuration: Route22Configuration())
        locationConfigurationLinkedList.appendLocation(configuration: Route2Configuration())
        locationConfigurationLinkedList.appendLocation(configuration: ViridianForestConfiguration())
        locationConfigurationLinkedList.appendLocation(configuration: PewterCityConfiguration())
        return locationConfigurationLinkedList
    }
}
