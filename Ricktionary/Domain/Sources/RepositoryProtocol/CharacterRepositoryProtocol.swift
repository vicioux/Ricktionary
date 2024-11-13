//
//  CharacterRepositoryProtocol.swift
//  
//
//  Created by Sergio Orozco on 12/11/24.
//

import Entities

public protocol CharacterRepositoryProtocol {
    func fetchCharacters(page: Int) async throws -> (Int, [CharacterEntity])
}
