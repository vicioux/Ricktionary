//
//  CharacterEntityFactory.swift
//  
//
//  Created by Sergio Orozco on 13/11/24.
//

import Foundation
import Entities

enum CharacterEntityFactory {
    static func createMockCharacter(id: Int = 1) -> CharacterEntity {
        CharacterEntity(
            id: id,
            name: "Rick Sanchez",
            status: "Alive",
            species: "Human",
            type: "",
            gender: "Male",
            origin: "Earth",
            location: "Earth",
            image: "https://example.com/image.jpg",
            episode: ["https://example.com/episode/1"],
            url: "https://example.com/character/1",
            created: "2017-11-04T18:48:46.250Z"
        )
    }
    
    static func createMockCharacters(count: Int) -> [CharacterEntity] {
        (0..<count).map { createMockCharacter(id: $0) }
    }
}
