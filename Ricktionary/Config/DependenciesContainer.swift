//
//  DependenciesContainer.swift
//  Ricktionary
//
//  Created by Sergio Orozco on 12/11/24.
//

import Foundation
import SwiftUI
import Repository
import Services
import UseCases

final class DependenciesContainer {
    let useCases: UseCases
    
    init(useCases: UseCases) {
        self.useCases = useCases
    }
    
    static let shared = DependenciesContainer(useCases: .default)
}

//MARK: Views
extension DependenciesContainer {
    func makeCharacterListView() -> some View {
        let viewModel = makeCharacterListViewModel()
        return CharacterListView(viewModel: viewModel)
    }
}

// MARK: View Models
extension DependenciesContainer {
    func makeCharacterListViewModel() -> CharacterListViewModel {
        return CharacterListViewModel(charUseCase: useCases.charactersUseCase)
    }
}

// MARK: Use Cases
extension DependenciesContainer {
    struct UseCases {
        let charactersUseCase: CharactersUseCase
        
        init(charactersUseCase: CharactersUseCase) {
            self.charactersUseCase = charactersUseCase
        }
        
        static var `default`: Self {
            .init(charactersUseCase: getCharactersUseCase())
        }
        
        // MARK: Use Cases DI
        private static func getCharactersUseCase() -> CharactersUseCase {
            return DefaultCharacterUseCase(characterRepository: CharacterRickpository())
        }
    }
}