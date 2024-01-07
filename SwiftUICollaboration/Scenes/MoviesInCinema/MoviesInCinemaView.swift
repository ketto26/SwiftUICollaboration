//
//  MoviesInCinemaView.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import SwiftUI

// MARK: - Movies In Cinema View

struct MoviesInCinemaView: View {
    @ObservedObject var viewModel = MoviesInCinemaViewModel()
    @State private var selectedMovie: Movie?
    @State private var isShowingReviews = false
    
    var body: some View {
        ScrollView {
            
            // MARK: - Movies Grid

            LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 10) {
                ForEach(viewModel.movies, id: \.id) { movie in
                    Button(action: {
                        selectedMovie = movie
                        isShowingReviews = true
                        viewModel.fetchReviewsForMovie(movieID: movie.id)
                    }) {
                        GridItemView(movie: movie)
                    }
                }
            }
            .padding()
            
            // MARK: - Reviews Sheet

            .sheet(isPresented: $isShowingReviews) {
                if let selectedMovie = selectedMovie {
                    ReviewsView(movie: selectedMovie, reviews: viewModel.selectedMovieReviews)
                }
            }
        }
        .background(Color(hex: "#1A2232"))
    }
}







#Preview {
    MoviesInCinemaView()
}
