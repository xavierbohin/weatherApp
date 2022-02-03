//
//  City.swift
//  WeatherApp
//
//  Created by xavier bohin on 02/02/2022.
//

import Foundation

struct City : Decodable {
    let name: String
    let lat: Double
    let lon: Double
    let country: String
}

extension City : Identifiable {
    var id: UUID {return UUID()}
}

struct MockData {
    
    static let cities = [sampleCity, sampleCity, sampleCity]
    
    static let sampleCity = City(name: "Paris", lat: 1, lon: 2, country: "Fr")
}
