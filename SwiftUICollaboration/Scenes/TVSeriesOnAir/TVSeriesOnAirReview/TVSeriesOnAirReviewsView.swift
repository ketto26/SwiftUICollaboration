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
            Text(series.name)
                .font(.title)
                .padding()
            
            if viewModel.reviews.isEmpty {
                Text("No reviews available")
                    .padding()
            } else {
                List(viewModel.reviews, id: \.id) { review in
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
        .background(Color(hex: 0x1A2232))
        .navigationTitle("Series Reviews")
        .onAppear {
            viewModel.fetchReviewsForSeries(apiKey: apiKey, seriesID: series.id)
        }
    }
}


extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
