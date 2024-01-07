//
//  ImageFromURL.swift
//  SwiftUICollaboration
//
//  Created by Sesili Tsikaridze on 06.01.24.
//

import SwiftUI

struct ImageFromURL: View {
    
    let imageString: String

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageString)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    Text("Image not found")
                case .empty:
                    Text("Loading...")
                @unknown default:
                    Text("Loading...")
                }
            }
        }
    }
    
}
