//
//  CharacterDetailView.swift
//  Ricktionary
//
//  Created by Sergio Orozco on 13/11/24.
//

import SwiftUI
import Kingfisher

struct CharacterDetailView: View {
    @StateObject
    var viewModel: CharacterDetailViewModel
    
    func titleTextView(_ text: String) -> some View {
        return Text(text)
            .font(.system(size: 14))
            .fontWeight(.bold)
            .foregroundColor(.primary)
    }
    
    func infoTextView(_ text: String) -> some View {
        return Text(text)
            .font(.system(size: 16))
            .foregroundColor(.secondary)
    }
    
    struct ImageContainer: View {
        let url: URL
        let width: CGFloat
        let height: CGFloat
        
        var body: some View {
            KFImage(url)
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
        }
    }

    func infoViewPill(label: String, value: String) -> some View {
        return VStack {
            titleTextView(label)
                .padding(.vertical, 5)
            infoTextView(value)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.white))
        .cornerRadius(8)
        .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 6)
    }

    func floatSection() -> some View {
        return VStack(alignment: .leading, spacing: 4) {
            Text(viewModel.char.name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(viewModel.char.gender)
                .font(.footnote)
                .foregroundColor(.black)
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
        .shadow(radius: 5)
        .offset(y: 30)
        .padding(.leading, 16)
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomLeading) {
                // Flag img
                if let flagURL = viewModel.char.image {
                    AsyncImage(url: flagURL) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Color.gray
                    }
                    .clipped()
                } else {
                    ProgressView()
                }
                floatSection()
            }
            .padding(.bottom, 30)
        
            
            HStack(spacing: 30) {
                infoViewPill(label: "Specie", value: viewModel.char.species)
                infoViewPill(label: "Status", value: viewModel.char.status)
            }
            
            HStack(spacing: 30) {
                infoViewPill(label: "Location", value: viewModel.char.location)
                infoViewPill(label: "Origin", value: viewModel.char.origin)
            }

            Spacer()
        }
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationBarTitle(Text(viewModel.char.name))
    }
}
