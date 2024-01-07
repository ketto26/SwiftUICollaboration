//
//  TVSeriesDetailsView.swift
//  SwiftUICollaboration
//
//  Created by Sesili Tsikaridze on 06.01.24.
//

import SwiftUI

struct TVSeriesDetailsView: View {
    @StateObject var viewModel: TVSeriesDetailsViewModel
    var BaseImageURL = "https://image.tmdb.org/t/p/w500"

    var body: some View {
        ZStack {
            Color(hex: "#1A2232")
                .ignoresSafeArea()

            VStack() {
                Text(viewModel.tvShowDetails.name)
                    .font(.system(size: 20, weight: .black))
                    .frame(height: 70)
                    .frame(maxWidth: .infinity)
                    .background(Color.init(hex: "#1F293D"))
                ImageFromURL(imageString: "\(BaseImageURL)\(viewModel.tvShowDetails.posterPath)")
                    .frame(height: 300)
                    .clipped()
                ratingInfo
                detailsInfo
                Spacer()
                Text(viewModel.tvShowDetails.overview)
                    .padding()
                Spacer()
                
            }
            .foregroundStyle(.white)
        }
    }
    
    var ratingInfo: some View {
        VStack(spacing: 5) {
            Text(String(format: "%.1f", viewModel.tvShowDetails.voteAverage))
                .font(.system(size: 20, weight: .black))
            Text("IMDB")
                .font(.system(size: 14, weight: .light))
                .foregroundStyle(.gray)
        }
        .frame(height: 70)
        .frame(maxWidth: .infinity)
        .background(Color.init(hex: "#1F293D"))

    }
    
    var detailsInfo: some View {
        HStack {
            Text("episodes: ")
            Text("\(viewModel.tvShowDetails.numberOfEpisodes)")
            Spacer()
            Text("seasons: ")
            Text("\(viewModel.tvShowDetails.numberOfSeasons)")
        }
        .foregroundStyle(.gray)
        .padding()
    }
}

#Preview {
    TVSeriesDetailsView(viewModel: TVSeriesDetailsViewModel(id: 206559))
}
