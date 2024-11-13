//
//  CharacterRowView.swift
//  Ricktionary
//
//  Created by Sergio Orozco on 12/11/24.
//

import SwiftUI
import Entities
import Kingfisher

struct CharacterRowView: View {
    var item: CharacterEntity
    
    var body: some View {
        HStack {
            
            KFImage(item.image)
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding(.trailing, 5)
            
            VStack(alignment:.leading) {
                Text(item.name)
                    .font(.system(size: 16))
                    .foregroundColor(.primary)
                Text(item.status)
                    .font(.system(size: 14))
                    .foregroundColor(.primary)
                Text(item.species)
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(10)  // Rounded corners
        .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 6)
    }
    
}
