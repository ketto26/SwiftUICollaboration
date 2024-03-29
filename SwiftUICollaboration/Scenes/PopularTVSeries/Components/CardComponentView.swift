//
//  CardComponentView.swift
//  SwiftUICollaboration
//
//  Created by Sesili Tsikaridze on 06.01.24.
//

import SwiftUI

struct CardComponentView: View {
    
    // MARK: - Components
    var tvShow: TVShow
    var BaseImageURL = "https://image.tmdb.org/t/p/w500"
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            productImageView
            productInfo
        }
        .frame(maxWidth: 150)
        .frame(height: 280)
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 10))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    // MARK: - Product Image
    private var productImageView: some View {
        
        ImageFromURL(imageString: (BaseImageURL + tvShow.backdropPath))
            .frame(width: 150, height: 250)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .clipped()
        
            .overlay(alignment: .topTrailing) {
                ratingLabel
                    .padding(5)
            }
        
    }
    
    // MARK: - Product Info
    private var productInfo: some View {
        VStack(alignment: .leading) {
            Text(tvShow.name)
                .font(.system(size: 16, weight: .bold))
            Text(tvShow.firstAirDate)
                .font(.system(size: 12, weight: .light))
        }
        .foregroundStyle(.white)
    }
    
    
    // MARK: - Rating
    private var ratingLabel: some View {
        Text(String(format: "%.1f", tvShow.voteAverage))
            .font(.system(size: 14, weight: .semibold))
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color(hex: "#FF8036"))
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    CardComponentView(tvShow: TVShow(backdropPath: "/v9nGSRx5lFz6KEgfmgHJMSgaARC.jpg", id: 206559, posterPath: "/v9nGSRx5lFz6KEgfmgHJMSgaARC.jpg", firstAirDate: "2005-10-13", name: "Binnelanders", voteAverage: 5.643))
}

