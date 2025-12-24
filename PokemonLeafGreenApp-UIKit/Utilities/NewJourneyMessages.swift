//
//  StartJourneyMessages.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/17/25.
//

struct NewJourneyMessages {
    static let newQuestMessage0 = "Welcome to the exciting world of pokemon."
    static let newQuestMessage1 = "My name is Dr. Bajwa, chief pokemon scientist of this entire region. And you are?"
    static func newQuestMessage2(playerName: String) -> String {
        return "Welcome \(playerName)! I'm sure you are excited to start your pokemon journey and train to become a pokemon master."
    }
    static let newQuestMessage3 = "Now that you are at the mature age of 11, you can start to venture off into the wilderness and fight other pokemon with pokemon you have forceibly captured."
    static let newQuestMessage4 = "There are plenty of pokemon to catch in the wild as well as other trainers to fight to help your own pokemon to gain experience, so don't hesitate to pick a fight with any trainer or gym leader."
    static let newQuestMessage5 = "But I'm sure you know how to do all of that already. So the last thing for you to do is choose your starting pokemon before you head off into the wild."
    static let newQuestMessage6 = "Which pokemon would like to choose?"
    static let chooseBulbasaur = "Ah, the grass-type pokemon, would you like to choose bulbasaur?"
    static let chooseCharmander = "Ah, the fire-type pokemon, would you like to choose charmader?"
    static let chooseSquirtle = "Ah, the water-type pokemon, would you like to choose squirtle?"
    static func newQuestMessage7(selectedPokemon: String) -> String {
        return "Congratulations! You have chosen \(selectedPokemon) to be your first pokemon."
    }
    static let newQuestMessage8 = "Oh no, my annoying nephew, Ash Ketchum, is here. He's here to start his pokemon journey too."
    static let newQuestMessage9 = "Hey Uncle Baj, I'm here to pick up your strongest pokemon."
    static func newQuestMessage10(selectedPokemon: String) -> String {
        return "Ash selected \(selectedPokemon)"
    }
    static func newQuestMessage11(playerName: String) -> String {
        return "Who are you?...\(playerName)? What a stupid name. I challenge you to a pokemon battle. Let's see how tough you are."
    }
    
    static let playerBeatAsh = "Ah my pokemon is weak. Whatever, I'm going to train hard and keep randomly coming up to you throughout our journeys to fight you. Smell ya later!"
    static let ashBeatPlayer = "Haha looks like you picked a weak and dumb pokemon. Try to make better decisions next time I battle you so its more of a challenge. Smell ya later!"
    
    static let newJourneyLines = [newQuestMessage0,
                                  newQuestMessage1,
                                  "",
                                  newQuestMessage3,
                                  newQuestMessage4,
                                  newQuestMessage5,
                                  newQuestMessage6,
                                  "",
                                  newQuestMessage8,
                                  newQuestMessage9,
                                  "",
                                  ""]
}
