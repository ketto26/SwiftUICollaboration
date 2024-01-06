//
//  PopularPersonsViewModel.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import SwiftUI
import NetworkManager

class PopularPersonsViewModel: ObservableObject {
    
    @Published var data: [People] = []
    
    init() {
        fetchData()
    }
    
    private func fetchData() {
        NetworkService.shared.getData(urlString: "https://api.themoviedb.org/3/person/popular?language=en-US&page=1&api_key=848852d71ffaab39cb06a12ad40fecbc") { [weak self] (result: Result<PopularPersonsModel, Error>) in
            guard let self else { return }
            
            switch result {
            case.success(let people):
                self.data = people.results
            case.failure(let error):
                print(error)
            }
        }
    }
}
