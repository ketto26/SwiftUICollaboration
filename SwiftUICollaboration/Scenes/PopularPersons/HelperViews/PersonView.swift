//
//  PersonView.swift
//  SwiftUICollaboration
//
//  Created by David on 1/6/24.
//

import SwiftUI

struct PersonView: View {
    
    // MARK: - Properties
    
    var person: People
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            
            // Async Image
            PersonImageView(person: person)
            
            // Person Details
            Text(person.name)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(person.knownForDepartment.rawValue)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: 200, maxHeight: 300)
        .cornerRadius(10)
    }
}

// Private PersonImageView
private struct PersonImageView: View {
    var person: People
    
    var body: some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(person.profilePath ?? "/r9oTasGQofvkQY5vlUXglneF64Z.jpg" )")) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .cornerRadius(10)
                    .overlay(
                        Rectangle()
                            .frame(width: 40, height: 20)
                            .cornerRadius(4)
                            .foregroundStyle(.orange)
                            .padding()
                            .overlay(
                                Text(String((person.popularity * 10).rounded() / 10))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: 30, maxHeight: 20)
                                    .minimumScaleFactor(0.1)
                                    .lineLimit(1)
                            )
                        , alignment: .topTrailing)
            case .failure(let error):
                Image(systemName: "photo")
                Text(error.localizedDescription)
            @unknown default:
                EmptyView()
            }
        }
    }
}

// MARK: - Preview

//#Preview {
//    PersonView()
//}
