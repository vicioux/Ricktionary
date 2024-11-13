//
//  MockCharacterRepository.swift
//
//
//  Created by Sergio Orozco on 13/11/24.
//

import Foundation
import RepositoryProtocol
import Entities

public class MockCharacterRepository: CharacterRepositoryProtocol {
    var shouldFail = false
    var characters: [CharacterEntity] = []
    var totalPages = 1
    
    public func fetchCharacters(page: Int) async throws -> (Int, [CharacterEntity]) {
        if shouldFail {
            throw NSError(domain: "MockError", code: -1)
        }
        return (totalPages, characters)
    }
}
