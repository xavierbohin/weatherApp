//
//  SelectCityViewModel.swift
//  weatherApp
//
//  Created by xavier bohin on 02/02/2022.
//

import Foundation

final class SelectCityViewModel : ObservableObject {
    
    @Published var cities : [City] = []
    @Published var alertItem : AlertItem?
    
    func getCities(cityName: String) {
        
        guard cityName.count>0 else {
            return
        }
        
        NetworkManager.shared.getCities(cityName: cityName) { [self] result in
            DispatchQueue.main.async {
                
                switch result {
                case .success(let cities):
                    self.cities = cities
                    
                case .failure(let error):
                    switch error {
                    case .invalidData :
                        self.alertItem = AlertContext.invalidData

                    case .invalidResponse :
                        self.alertItem = AlertContext.invalidResponse

                    case .invalidURL :
                        self.alertItem = AlertContext.invalidURL

                    case .unableToComplete :
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
        
    }
    
    
}
