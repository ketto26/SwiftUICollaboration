//
//  PopularPersonsViewModel.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import SwiftUI
import NetworkManager

class PopularPersonsViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var data: [People] = []
    
    // MARK: - Initialization
    
    init() {
        fetchData()
    }
    
    // MARK: - Private Methods
    
    private func fetchData() {
        let urlString = "https://api.themoviedb.org/3/person/popular?language=en-US&page=1&api_key=848852d71ffaab39cb06a12ad40fecbc"
        
        NetworkService.shared.getData(urlString: urlString) { [weak self] (result: Result<PopularPersonsModel, Error>) in
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
