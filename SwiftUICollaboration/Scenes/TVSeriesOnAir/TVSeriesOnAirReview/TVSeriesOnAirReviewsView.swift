//
//  TVSeriesOnAirReviewsView.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 06.01.24.
//



import SwiftUI

struct SeriesDetailsView: View {
    // MARK: - Properties
    let series: TVSeries
    let apiKey: String
    @StateObject var viewModel = SeriesDetailsViewModel()
    
    // MARK: - Body
    var body: some View {
        VStack {
            Text(series.name)
                .font(.title)
                .padding()
            
            if viewModel.reviews.isEmpty {
                Text("No reviews for \(series.name)")
                    .padding()
            } else {
                List(viewModel.reviews) { review in
                    VStack(alignment: .leading) {
                        Text(review.author)
                            .font(.headline)
                        Text(review.content)
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: 0x1A2232))
        .navigationTitle("Series Reviews")
        .onAppear {
            
            // MARK: - Fetch Reviews
            viewModel.fetchReviewsForSeries(apiKey: apiKey, seriesID: series.id)
        }
    }
}


