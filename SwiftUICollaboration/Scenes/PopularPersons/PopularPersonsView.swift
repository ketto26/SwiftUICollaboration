//
//  PopularPersonsView.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import SwiftUI

struct PopularPersonsView: View {
    
    @StateObject var model = PopularPersonsViewModel()
    
    var gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        
        
        ScrollView {
            LazyVGrid(columns: gridLayout, content: {
                ForEach(model.data.results) { people in
                    PersonView(person: people)
                    
                }
                .padding()
            })
        }
//                VStack {
//                    List(model.data.results) { people in
//                        Text(people.name)
//        
//        
//                    }
//                    .background(.purple)
//        
//                }
        
        
    }
}

#Preview {
    PopularPersonsView()
}
