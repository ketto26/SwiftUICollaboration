//
//  DetailsView.swift
//  SwiftUICollaboration
//
//  Created by David on 1/7/24.
//

import SwiftUI

struct DetailsView: View {
    
    // MARK: - Properties
    var model: People
    
    // MARK: - Initializer
    init(model: People) {
        self.model = model
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().barTintColor = .clear
    }
    
    // MARK: - Body
    
    var body: some View {
        
        ScrollView{
            
            VStack{
                
                // MARK: - Async Image
                
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(model.profilePath ?? "/r9oTasGQofvkQY5vlUXglneF64Z.jpg" )")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        let maxWidth = UIScreen.main.bounds.width * 0.75
                        image.resizable()
                            .frame(maxWidth: maxWidth, maxHeight: maxWidth * 3/2)
                        
                            .cornerRadius(10)
                        
                            .overlay(
                                Rectangle()
                                    .frame(width: 40, height: 20)
                                    .cornerRadius(4)
                                    .foregroundStyle(.orange)
                                    .padding()
                                    .overlay(
                                        Text(String((model.popularity * 10).rounded() / 10))
                                            .fontWeight(.bold)
                                            .foregroundStyle(.white)
                                            .frame(maxWidth: 30, maxHeight: 20)
                                            .minimumScaleFactor(0.1)
                                            .lineLimit(1)
                                    )
                                , alignment: .topTrailing)
                            .padding(10)
                    case .failure(let error):
                        Image(systemName: "photo")
                        Text(error.localizedDescription)
                    @unknown default:
                        EmptyView()
                    }
                }
                
                // MARK: - Overview Text
                
                Text("Overview")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                
                Text(model.knownFor?.first?.overview ?? "Overview Error")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .padding()
                
                // MARK: - Details Text
                
                Text("Details")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                
                // MARK: - HStack for Details
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 10, content: {
                        
                        Text("Gender:")
                        
                        Text("Known For:")
                        
                        Text("Country:")
                        
                        Text("Media Type:")
                        
                        Text("First air date:")
                        
                        Text("Vote Average:")
                        
                        Text("Vote Count:")
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.white)
                    
                    VStack(spacing: 10, content: {
                        
                        Text((model.gender == 1) ? "Female": "Male")
                        
                        Text(model.knownFor?.first?.mediaType.rawValue ?? "Error")
                        
                        Text("\(model.knownForDepartment.rawValue)")
                        
                        Text(model.knownFor?.first?.originCountry?.first ?? "Error")
                        
                        Text(model.knownFor?.first?.firstAirDate ?? "Error")
                        
                        Text(String(model.knownFor?.first?.voteAverage ?? 0))
                        
                        Text(String(model.knownFor?.first?.voteCount ?? 0))
                    })
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .padding(.horizontal, 40)
            }
            .navigationTitle("\(model.name)")
        }
        .background {
            Color(red: 0.10196078431372549, green: 0.13333333333333333, blue: 0.19607843137254902)
                .ignoresSafeArea()
        }
    }
}

//#Preview {
//    DetailsView()
//}
