//
//  MainView.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MovieListView()
                .tabItem {
                    Label("Movies", systemImage: "film")
                    
                }
            
            PopularPersonsView()
                .tabItem {
                    Label("Persons", systemImage: "person.2")
                }
            
            PopularTVSeriesView()
                .tabItem {
                    Label("TV Series", systemImage: "tv")
                }
            
            MoviesInCinemaView()
                .tabItem {
                    Label("Cinema", systemImage: "movieclapper")
                }
            
            TVSeriesOnAirView()
                .tabItem {
                    Label("On Air", systemImage: "play.tv")
                }
        }
    }
}

#Preview {
    MainView()
}
