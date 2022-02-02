//
//  SelectCityViewModel.swift
//  weatherApp
//
//  Created by xavier bohin on 02/02/2022.
//

import Foundation

final class SelectCityViewModel : ObservableObject {
    
    @Published var cities : [City] = []
    
    
    func getCities(cityName: String) {
        
        NetworkManager.shared.getCities(cityName: cityName) { [self] result in
            DispatchQueue.main.async {
                
                switch result {
                case .success(let cities):
                    self.cities = cities
                    
                case .failure(let error):
                    switch error {
                    case .invalidData :
                        print("invalidData")
                        
                    case .invalidResponse :
                        print("invalidResponse")
                        
                    case .invalidURL :
                        print("invalidURL")
                        
                    case .unableToComplete :
                        print("unableToComplete")
                        
                    }
                }
            }
        }
        
    }
    
    
}
