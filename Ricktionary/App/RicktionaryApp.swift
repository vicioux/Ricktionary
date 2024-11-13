//
//  RicktionaryApp.swift
//  Ricktionary
//
//  Created by Sergio Orozco on 12/11/24.
//

import SwiftUI

@main
struct RicktionaryApp: App {
    var body: some Scene {
        WindowGroup {
            DependenciesContainer.shared.makeCharacterListView()
        }
    }
}
