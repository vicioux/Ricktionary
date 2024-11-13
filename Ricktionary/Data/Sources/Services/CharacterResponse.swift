//
//  File.swift
//  
//
//  Created by Sergio Orozco on 12/11/24.
//

import Foundation
import Entities

public struct CharacterResponse: Decodable {
    public let info: PageInfo
    public let results: [CharacterInfoResponse]
}

public struct CharacterInfoResponse: Decodable, Identifiable {
    public let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: LocationInfo
    let location: LocationInfo
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

public struct LocationInfo: Decodable {
    let name: String
    let url: String
}

public struct PageInfo: Decodable {
    let count: Int
    public let pages: Int
    let next: String?
    let prev: String?
}

extension CharacterInfoResponse {
    public func toCharEntity() -> CharacterEntity {
        return CharacterEntity(id: id,
                               name: name,
                               status: status,
                               species: species,
                               type: type,
                               gender: gender,
                               origin: origin.name,
                               location: location.name,
                               image: image,
                               episode: episode,
                               url: url,
                               created: created)
    }
}
