//
//  Weather.swift
//  WeatherApp
//
//  Created by xavier bohin on 02/02/2022.
//

import Foundation

struct WeatherData: Decodable {
    
    struct Current: Decodable {
        var dt = 1618317040
        var temp = 284.0
        var feels_like = 282.0
        var humidity = 62.0
        var wind_speed = 6.0
        var wind_deg = 300.0
        
        struct Weather: Decodable {
            var description = "light rain"
            var icon = "10d"
        }

        var weather = [Weather]()
    }
    
    struct Daily: Decodable {
        var dt = 1618308000
        
        struct Temp: Decodable {
            var min = 275.09
            var max = 284.07
        }
        
        struct Weather: Decodable {
            var icon = "10d"
        }
        
        var temp = Temp()
        var weather = [Weather]()
    }
    
    var current = Current()
    var daily = [Daily]()
}
