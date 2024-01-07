//
//  MovieListView.swift
//  Movies
//
//  Created by Natia Khizanishvili on 07.01.24.
//

import SwiftUI

struct MovieListView: View {
    @StateObject private var viewModel = MovieListViewModel()
    
    var body: some View {
        List(viewModel.movies) { movie in
            NavigationLink(destination: MovieDetailsView(movie: movie)) {
                MovieCell(movie: movie)
            }
        }
        .onAppear {
            viewModel.fetchMovies()
        }
        .navigationTitle("Popular Movies")
    }
}

#Preview {
    MovieListView()
}
