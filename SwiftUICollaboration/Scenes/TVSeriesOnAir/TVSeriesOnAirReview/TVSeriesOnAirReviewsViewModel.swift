//
//  TVSeriesOnAirReviewsViewModel.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 06.01.24.
//

import Foundation
import NetworkManager

// MARK: - Review Response Model
struct ReviewResponse: Decodable {
    let results: [Review]
}

// MARK: - Series Details View Model
final class SeriesDetailsViewModel: ObservableObject {
    
    // MARK: Published Properties
    @Published var reviews: [Review] = []
    
    // MARK: Fetch Reviews
    func fetchReviewsForSeries(apiKey: String, seriesID: Int) {
        let reviewEndpoint = "/tv/\(seriesID)/reviews"
        let reviewURLString = "https://api.themoviedb.org/3\(reviewEndpoint)?api_key=\(apiKey)"
        
        NetworkService.shared.getData(urlString: reviewURLString) { (result: Result<ReviewResponse, Error>) in
            switch result {
            case .success(let decodedData):
                DispatchQueue.main.async {
                    self.reviews = decodedData.results
                }
            case .failure(let error):
                print("Error fetching reviews: \(error.localizedDescription)")
            }
        }
    }
}
