//
//  WeatherPageViewModel.swift
//  weatherApp
//
//  Created by xavier bohin on 02/02/2022.
//

import Foundation

final class WeatherPageViewModel: ObservableObject {
    
    @Published var weatherData : WeatherData?
    @Published var alertItem : AlertItem?
    
    func getWeather(lat: Double, lon: Double) {
        NetworkManager.shared.getWeather(lat: lat, lon: lon) { [self] result in
            DispatchQueue.main.async {
                
                switch result {
                case .success(let weatherData):
                    self.weatherData = weatherData
                    
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
