//
//  ReviewsView.swift
//  SwiftUICollaboration
//
//  Created by tornike <parunashvili on 06.01.24.
//

import SwiftUI

struct ReviewsView: View {
    let movie: Movie
    let reviews: [Review]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if !movie.posterPath.isEmpty {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 200)
                                .cornerRadius(10)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 200)
                                .foregroundColor(.gray)
                                .cornerRadius(10)
                        @unknown default:
                            EmptyView()
                        }
                    }
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .foregroundColor(.gray)
                        .cornerRadius(10)
                }
                Text("Reviews for \(movie.title)")
                    .font(.title)
                    .padding(.top, 10)
                    .foregroundColor(.white)
                Spacer()
                
                ForEach(reviews, id: \.id) { review in
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Author: \(review.author)")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text(review.content)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(.white)
                        
                        if let rating = review.authorDetails?.rating {
                            Text("Rating: \(rating)")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        } else {
                            Text("Rating: N/A")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                    }
                    .padding()
                    .border(Color.gray, width: 1)
                    .cornerRadius(10)
                }
            }
            .padding()
        }
        .background(Color(hex: "1A2232"))
    }
}



