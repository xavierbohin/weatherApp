//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by xavier bohin on 02/02/2022.
//

import Foundation
import UIKit
import SwiftUI

class NetworkManager: NSObject {
    
    static let shared             = NetworkManager()
    
    static let baseURL            = "https://api.openweathermap.org/"
    private let geocodingURL      = baseURL + "geo/1.0/direct"
    private let oneCallWeatherURL = baseURL + "data/2.5/onecall"
    private let appId             = "c17fbdee7b939702febc77d39197d75a"
    
    
    func getCities(cityName: String, completed: @escaping (Result<[City], APError>) -> Void) {
        guard let url = URL(string: geocodingURL + "?q=\(cityName)&limit=5&appid=\(appId)") else {
            completed(.failure(.invalidURL))
            return
        }
               
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
                        
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([City].self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    func getWeather(lat: Double, lon: Double, completed: @escaping (Result<WeatherData, APError>) -> Void) {
        guard let url = URL(string: oneCallWeatherURL + "?lat=\(lat)&lon=\(lon)&appid=\(appId)") else {
            completed(.failure(.invalidURL))
            return
        }
               
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
                        
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(WeatherData.self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
}
