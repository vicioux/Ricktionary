//
//  CharacterService.swift
//  
//
//  Created by Sergio Orozco on 12/11/24.
//

import Foundation

public class CharacterService {
    
    public init() { }
    
    public func fetchCharacters() async throws -> CharacterResponse {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=2") else {
            throw URLError(.badURL)
        }
        
        do {
            let request = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw URLError(.badServerResponse)
            }
            
            let countries = try JSONDecoder().decode(CharacterResponse.self, from: data)
            return countries
        } catch let error {
            throw error
        }
    }
}
