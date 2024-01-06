//
//  PopularPersonsView.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import SwiftUI

struct PopularPersonsView: View {
    
    @StateObject var model = PopularPersonsViewModel()
    
    private var gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: gridLayout, content: {
                ForEach(model.data) { people in
                    PersonView(person: people)
                }
                .padding()
            })
        }
        .background(Color(red: 0.10196078431372549, green: 0.13333333333333333, blue: 0.19607843137254902))
    }
}

#Preview {
    PopularPersonsView()
}
