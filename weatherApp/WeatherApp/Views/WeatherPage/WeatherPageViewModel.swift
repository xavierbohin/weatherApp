//
//  WeatherPageViewModel.swift
//  weatherApp
//
//  Created by xavier bohin on 02/02/2022.
//

import Foundation

class WeatherPageViewModel: ObservableObject {
    
    @Published var weatherData = WeatherData()
    
    func getWeather(lat: Double, lon: Double) {
        NetworkManager.shared.getWeather(lat: lat, lon: lon) { result in
            switch result {
            case .success(let weatherData):
                self.weatherData = weatherData
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
