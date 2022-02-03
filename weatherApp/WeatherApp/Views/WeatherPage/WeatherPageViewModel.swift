//
//  WeatherPageViewModel.swift
//  weatherApp
//
//  Created by xavier bohin on 02/02/2022.
//

import Foundation

class WeatherPageViewModel: ObservableObject {
    
    @Published var weatherData : WeatherData?
    
    func getWeather(lat: Double, lon: Double) {
        NetworkManager.shared.getWeather(lat: lat, lon: lon) { [self] result in
            DispatchQueue.main.async {
                
                switch result {
                case .success(let weatherData):
                    self.weatherData = weatherData
                case .failure(let error):
                    switch error {
                    case .invalidData :
                        print(error)
                        
                    case .invalidResponse :
                        print(error)
                        
                    case .invalidURL :
                        print(error)
                        
                    case .unableToComplete :
                        print(error)
                    }
                }
                
            }
            
        }
    }
    
}
