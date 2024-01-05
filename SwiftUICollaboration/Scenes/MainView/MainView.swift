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
            PopularMoviesView()
                .tabItem {
                    Label("Popular Movies", systemImage: "film")
                }
            
            PopularPersonsView()
                .tabItem {
                    Label("Popular Persons", systemImage: "person.2")
                }
            
            PopularTVSeriesView()
                .tabItem {
                    Label("Popular TV Series", systemImage: "tv")
                }
            
            MoviesInCinemaView()
                .tabItem {
                    Label("Movies in Cinema", systemImage: "movieclapper")
                }
            
            TVSeriesOnAirView()
                .tabItem {
                    Label("TV Series On Air", systemImage: "play.tv")
                }
        }
    }
}

#Preview {
    MainView()
}
