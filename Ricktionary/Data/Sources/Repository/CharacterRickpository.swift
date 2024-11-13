//
//  CharacterRickpository.swift
//
//
//  Created by Sergio Orozco on 12/11/24.
//

import Foundation
import RepositoryProtocol
import Entities
import Services

public class CharacterRickpository: CharacterRepositoryProtocol {
    
    let charService = CharacterService()
    
    public init() {}
    
    public func fetchCharacters() async throws -> (Int, [CharacterEntity]) {
        let charResult = try await charService.fetchCharacters()
        let charEntities = charResult.results.map { $0.toCharEntity() }
        return (charResult.info.pages, charEntities)
    }
    
    
}
