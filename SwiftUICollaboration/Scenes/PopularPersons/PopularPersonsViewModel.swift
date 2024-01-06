//
//  PopularPersonsViewModel.swift
//  SwiftUICollaboration
//
//  Created by Keto Nioradze on 05.01.24.
//

import SwiftUI
import NetworkManager

class PopularPersonsViewModel: ObservableObject {
    
    @Published var data: PopularPersonsModel = PopularPersonsModel(results: [People(adult: true, gender: 1, knownForDepartment: .acting, name: "Test", originalName: "Test", popularity: 1.0, profilePath: "1", knownFor: nil)])
    
    init() {
        fetchData()
    }
    private func fetchData() {
        NetworkService.shared.getData(urlString: "https://api.themoviedb.org/3/person/popular?language=en-US&page=1&api_key=848852d71ffaab39cb06a12ad40fecbc") { [weak self] (result: Result<PopularPersonsModel, Error>) in
            guard let self else { return }
            
            switch result {
            case.success(let people):
                self.data = people
            case.failure(let error):
                print(error)
            }
            
        }
    }
    
}
