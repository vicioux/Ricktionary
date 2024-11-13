//
//  CharacterDetailViewModel.swift
//  Ricktionary
//
//  Created by Sergio Orozco on 13/11/24.
//

import SwiftUI
import UseCases
import Entities

class CharacterDetailViewModel: ObservableObject {
    @Published var char: CharacterEntity
    
    init(char: CharacterEntity) {
        self.char = char
    }
}
