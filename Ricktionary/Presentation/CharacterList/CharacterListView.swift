//
//  CharacterListView.swift
//  Ricktionary
//
//  Created by Sergio Orozco on 12/11/24.
//

import SwiftUI
import Entities

struct CharacterListView: View {
    @StateObject var viewModel: CharacterListViewModel
    
    private func RowItem(_ item: CharacterEntity) -> some View {
        return CharacterRowView(item: item)
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
    }
    
    private func LoadingRow() -> some View {
        return HStack {
            Spacer()
            ProgressView()
                .onAppear {
                    Task {
                        await viewModel.loadChars()
                    }
                }
            Spacer()
        }
    }
    
    private func LoadingView() -> some View {
        return ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(1.5)
            .padding()
    }
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.loadState {
                case .loading:
                    LoadingView()
                case .loaded:
                    List {
                        ForEach(viewModel.filteredChars) { item in
                            RowItem(item)
                        }
                        if viewModel.hasMorePages && viewModel.filteredChars.isEmpty {
                            LoadingRow()
                        }
                    }
                    .listStyle(.plain)
                    .navigationTitle("Characters")
                case .empty:
                    Text("Empty")
                case .error:
                    Text("Error")
                }
            }
            .searchable(
                text: $viewModel.searchText,
                placement: .navigationBarDrawer,
                prompt: "Search Characters"
            )
            .onAppear {
                Task { await viewModel.loadChars(isFirstLoad: true) }
            }
        }
    }
}
