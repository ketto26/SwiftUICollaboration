//
//  PopularPersonsView.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import SwiftUI

struct PopularPersonsView: View {
    
    // MARK: - Properties
    
    @StateObject private var model = PopularPersonsViewModel()
    
    // Grid layout for LazyVGrid
    
    private let gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Initialization
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().barTintColor = .clear
    }
    
    // MARK: - Body
    
    var body: some View {
        
        // Navigation Stack
        NavigationStack {
            
            // Scrollable content
            ScrollView {
                LazyVGrid(columns: gridLayout, content: {
                    ForEach(model.data) { people in
                        
                        // Navigation Link for each person
                        NavigationLink(value: people) {
                            PersonView(person: people)
                        }
                    }
                    .padding()
                })
            }
            .background(Color(red: 0.10196078431372549, green: 0.13333333333333333, blue: 0.19607843137254902))
            .navigationTitle("Popular People")
            .navigationDestination(for: People.self) { people in
                DetailsView(model: people)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    PopularPersonsView()
}
