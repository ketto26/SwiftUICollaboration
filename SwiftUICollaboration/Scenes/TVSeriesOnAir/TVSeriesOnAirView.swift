//
//  TVSeriesOnAirView.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import SwiftUI

struct TVSeriesOnAirView: View {
    // MARK: - Properties
    @StateObject private var viewModel = TVSeriesViewModel()
    
    // MARK: - Body
    var body: some View {
        
        NavigationView {
            List(viewModel.tvSeries, id: \.id) { series in
                NavigationLink(destination: SeriesDetailsView(series: series, apiKey: "d8ff3e307af3e5b687d07d89d33e6128")) {
                    
                    HStack {
                        if let posterPath = series.posterPath,
                           let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
                            AsyncImageView(url: imageURL)
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 75)
                                .cornerRadius(8)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(series.name)
                                .font(.headline)
                            Text("First air date: \(series.firstAirDate)")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("TV Series on the Air")
        }
        .onAppear {
            viewModel.fetchTVSeries()
        }
    }
}


#Preview {
    TVSeriesOnAirView()
}
