//
//  TVSeriesOnAirReviewsView.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 06.01.24.
//



import SwiftUI

struct SeriesDetailsView: View {
    let series: TVSeries
    let apiKey: String
    @StateObject var viewModel = SeriesDetailsViewModel()

    var body: some View {
        VStack {
            Text("Series Name: \(series.name)")
                .font(.title)
                .padding()
            
            if viewModel.reviews.isEmpty {
                Text("No reviews available")
                    .padding()
            } else {
                List(viewModel.reviews, id: \.id) { review in
                    VStack(alignment: .leading) {
                        Text("Author: \(review.author)")
                            .font(.headline)
                        Text("Content: \(review.content)")
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
            }
            
            Spacer()
        }
        .navigationTitle("Series Details")
        .onAppear {
            viewModel.fetchReviewsForSeries(apiKey: apiKey, seriesID: series.id)
        }
    }
}
