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
    private let cache             = NSCache<NSString, UIImage>()
    
    static let baseURL            = "https://api.openweathermap.org/"
    private let geocodingURL      = baseURL + "geo/1.0/direct"
    private let oneCallWeatherURL = baseURL + "data/2.5/onecall"
    private let appId             = "c17fbdee7b939702febc77d39197d75a"
    private let locale            = "locale".localized()
    
    
    func getCities(cityName: String, completed: @escaping (Result<[City], APError>) -> Void) {
        let queryItems = [URLQueryItem(name: "q", value: cityName),
                          URLQueryItem(name: "limit", value: "5"),
                          URLQueryItem(name: "appid", value: appId)]
        var urlComps = URLComponents(string: geocodingURL)
        urlComps?.queryItems = queryItems
        
        guard let url = urlComps?.url else {
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
        guard let url = URL(string: oneCallWeatherURL + "?lat=\(lat)&lon=\(lon)&appid=\(appId)&lang=" + locale) else {
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
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
    
    
}
