//
//  CharacterRepositoryProtocol.swift
//  
//
//  Created by Sergio Orozco on 12/11/24.
//

import Entities

public protocol CharacterRepositoryProtocol {
    func fetchCharacters() async throws -> (Int, [CharacterEntity])
}
