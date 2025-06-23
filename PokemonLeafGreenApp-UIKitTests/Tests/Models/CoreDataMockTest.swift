//
//  CoreDataMockTest.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/22/25.
//

import XCTest
import CoreData
@testable import PokemonLeafGreenApp_UIKit

final class CoreDataMockTest: XCTestCase {
    var decoder: JSONDecoder!
    
    override func setUp() {
        decoder = JSONDecoder()
    }
    
    override func tearDown() {
        decoder = nil
    }
    
    func testAdaptCoreDataMove() {
        let pokeAPIMoveMockData = Data(PokeAPIMocks.PokeAPIMove.utf8)
        var pokeAPIMoveMockResponse: PokeAPIMoveDetails!
        
        do {
            pokeAPIMoveMockResponse = try decoder.decode(PokeAPIMoveDetails.self, from: pokeAPIMoveMockData)
        } catch {
            XCTFail("Could not decode mock data")
        }
        
        let coreDataMove = CoreDataMove()
        coreDataMove.adapt(pokeAPIMoveModel: pokeAPIMoveMockResponse)
        
        XCTAssertEqual(coreDataMove.id, 1)
        XCTAssertEqual(coreDataMove.name, "pound")
        XCTAssertEqual(coreDataMove.accuracy, 100)
        XCTAssertEqual(coreDataMove.pp, 35)
        XCTAssertEqual(coreDataMove.power, 40)
        XCTAssertEqual(coreDataMove.moveType, "normal")
        XCTAssertEqual(coreDataMove.moveDescription, "A physical attack delivered with a long tail or a foreleg, etc.")
    }
}
