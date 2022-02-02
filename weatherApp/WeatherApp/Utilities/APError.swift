//
//  APError.swift
//  WeatherApp
//
//  Created by xavier bohin on 02/02/2022.
//

import Foundation

enum APError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}
