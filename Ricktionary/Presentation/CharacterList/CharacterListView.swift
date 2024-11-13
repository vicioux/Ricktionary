//
//  CharacterListView.swift
//  Ricktionary
//
//  Created by Sergio Orozco on 12/11/24.
//

import SwiftUI
import Entities

struct CharacterListView: View {
    @StateObject
    var viewModel: CharacterListViewModel
    
    private func RowItem(_ item: CharacterEntity) -> some View {
        return CharacterRowView(item: item)
//            .overlay { // Using this overlay to avoid chevron icon to detail -_- Yeah this is kind of hacky -_-
////                NavigationLink(destination: DependenciesContainer.shared.makeCountryDetailView(for: item)) { /*Empty space*/ }
////                    .opacity(0)
//            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
    }
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.loadState {
                case .loading:
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                        .padding()
                case .loaded:
                    List(viewModel.chars) { item in
                        RowItem(item)
                    }
                    .listStyle(.plain)
                    .navigationTitle("Characters")

                case .empty :
                    Text("Empty")
                case .error:
                    Text("Error")
                }
            }.onAppear {
                Task { await viewModel.loadChars() }
            }
        }
    }
}
