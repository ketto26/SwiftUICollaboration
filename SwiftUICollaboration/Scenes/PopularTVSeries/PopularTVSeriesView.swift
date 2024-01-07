//
//  PopularTVSeriesView.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import SwiftUI

struct PopularTVSeriesView: View {
    
    //MARK: - Properties
    
    @StateObject private var viewModel = PopularTVSeriesViewModel()
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private let baseImageURL = "https://image.tmdb.org/t/p/"
    
    //MARK: - Body
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#1A2232")
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Popular TV Series")
                        .font(.system(size: 20, weight: .black))
                        .foregroundStyle(.white)
                    Spacer()
                    showsGridView
                }
                .padding()
            }
        }
    }
    
    private var showsGridView: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.tvShows, id: \.id) { tvShow in
                    tvShowsSetup(tvShow)
                }
            }
        }
    }
    
    
    private func tvShowsSetup(_ tvShow: TVShow) -> some View {
        NavigationLink(value: tvShow) {
            CardComponentView(tvShow: tvShow)
        }
        .navigationDestination(for: TVShow.self) { tvShow in
            TVSeriesDetailsView(viewModel: TVSeriesDetailsViewModel(id: tvShow.id))
        }
        
    }
}

#Preview {
    PopularTVSeriesView()
}
