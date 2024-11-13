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
    @Published var searchText: String = ""
    
    var filteredChars: [CharacterEntity] {
        guard !searchText.isEmpty else { return chars }
        return chars.filter { char in
            char.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    private var currentPage = 1
    private var totalPages: Int?
    private var isLoadingChars = false
    
    var hasMorePages: Bool {
        guard let totalPages else { return true }
        return currentPage <= totalPages
    }
    
    init(charUseCase: CharactersUseCase) {
        self.charUseCase = charUseCase
    }
    
    func loadChars(isFirstLoad: Bool = false) async {
        guard !isLoadingChars else { return }
        if !searchText.isEmpty { return }
        
        if isFirstLoad {
            currentPage = 1
            await updateUIState(.loading)
        }
        
        isLoadingChars = true
        
        do {
            let (pages, results) = try await charUseCase.execute(page: currentPage)
            totalPages = pages
            currentPage += 1
            
            await MainActor.run {
                if isFirstLoad {
                    chars = results
                    loadState = results.isEmpty ? .empty : .loaded
                } else {
                    chars.append(contentsOf: results)
                }
            }
            
        } catch {
            if isFirstLoad {
                await updateUIState(.error)
            }
        }
        
        isLoadingChars = false
    }
    
    @MainActor
    private func updateUIState(_ state: DataState) async {
        loadState = state
    }
}

