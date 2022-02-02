//
//  City.swift
//  WeatherApp
//
//  Created by xavier bohin on 02/02/2022.
//

import Foundation

struct City : Decodable, Identifiable {
    var id: Int
    let name: String
    let lat: Double
    let lon: Double
    let country: String
}

struct CityResponse : Decodable {
    let cities : [City]
}
