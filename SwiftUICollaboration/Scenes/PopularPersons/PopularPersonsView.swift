//
//  PopularPersonsView.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import SwiftUI

struct PopularPersonsView: View {
    
    @StateObject var model = PopularPersonsViewModel()
    
    var body: some View {
        
        List(model.data.results) { people in
            Text(people.name)
        }
    }
}

#Preview {
    PopularPersonsView()
}
