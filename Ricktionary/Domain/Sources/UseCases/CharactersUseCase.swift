//
//  CharactersUseCase.swift
//
//
//  Created by Sergio Orozco on 12/11/24.
//

import Foundation
import Entities
import RepositoryProtocol

public protocol CharactersUseCase {
    func execute() async throws -> (Int, [CharacterEntity])
}

public final class DefaultCharacterUseCase: CharactersUseCase {
    
    private let characterRepository: CharacterRepositoryProtocol!
    
    public init(characterRepository: CharacterRepositoryProtocol) {
        self.characterRepository = characterRepository
    }
    
    public func execute() async throws -> (Int, [CharacterEntity]) {
        return try await characterRepository.fetchCharacters()
    }
}
