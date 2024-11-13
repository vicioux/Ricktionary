//
//  CharacterListViewModel.swift
//  Ricktionary
//
//  Created by Sergio Orozco on 12/11/24.
//

import SwiftUI
import UseCases
import Entities

enum DataState {
    case loading
    case loaded
    case empty
    case error
}

class CharacterListViewModel: ObservableObject {
    var charUseCase: CharactersUseCase
    
    @Published var chars: [CharacterEntity] = []
    @Published var loadState: DataState = .loading
    
    private var currentPage = 1
    private var totalPages: Int?
    
    private var hasMorePages: Bool {
        guard let totalPages else { return true }
        return currentPage <= totalPages
    }
    
    init(charUseCase: CharactersUseCase) {
        self.charUseCase = charUseCase
    }
    
    func loadChars() async {
        await updateUIState(.loading)
        
        do {
            let (pages, results) = try await charUseCase.execute()
            
            await MainActor.run {
                chars = results
                loadState = results.isEmpty ? .empty : .loaded
            }
            
        } catch {
            await updateUIState(.error)
        }
    }
    
    @MainActor
    private func updateUIState(_ state: DataState) async {
        loadState = state
    }
    
}
