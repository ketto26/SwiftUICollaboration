//
//  ReviewsView.swift
//  SwiftUICollaboration
//
//  Created by tornike <parunashvili on 06.01.24.
//

import SwiftUI

// MARK: - ReviewsView

struct ReviewsView: View {
    let movie: Movie
    let reviews: [MoviesReview]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                moviePoster
                movieTitle
                reviewsList
            }
            .padding()
        }
        .background(Color(hex: "1A2232"))
    }
    
    // MARK: - Subviews
    
    private var moviePoster: some View {
        movie.moviePoster(urlString: "https://image.tmdb.org/t/p/w500\(movie.posterPath)",
                          placeholderSize: CGSize(width: 100, height: 150),
                          imageSize: CGSize(width: 150, height: 200))
    }
    
    private var movieTitle: some View {
        Text("Reviews for \(movie.title)")
            .font(.title)
            .padding(.top, 10)
            .foregroundColor(.white)
    }
    
    private var reviewsList: some View {
        ForEach(reviews, id: \.id) { review in
            ReviewItem(review: review)
        }
    }
}

// MARK: - ReviewItem Subview

struct ReviewItem: View {
    let review: MoviesReview
    
    var body: some View {
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




