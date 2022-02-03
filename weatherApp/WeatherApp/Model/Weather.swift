//
//  Weather.swift
//  WeatherApp
//
//  Created by xavier bohin on 02/02/2022.
//

import Foundation

struct WeatherData: Decodable {
    
    struct Current: Decodable {
        let dt : TimeInterval
        let temp : Double
        let feels_like : Double
        let humidity : Double
        let wind_speed : Double
        let wind_deg : Double
        
        struct Weather: Decodable {
            var description : String
            var icon : String
        }

        var weather : [Weather]
    }
    
    struct Daily: Decodable {
        var dt : TimeInterval
        
        struct Temp: Decodable {
            var min : Double
            var max : Double
        }
        
        struct Weather: Decodable {
            var icon : String
        }
        
        var temp : Temp
        var weather : [Weather]
    }
    
    var current : Current
    var daily : [Daily]
}

extension WeatherData.Daily : Identifiable {
    var id: UUID {return UUID()}
}

extension MockData {
    
    static let weathers = [ WeatherData.Current.Weather(description: "rain", icon: "10d") ]
    static let dailies = [ WeatherData.Daily(dt: 1618308000, temp: WeatherData.Daily.Temp(min: 275.09, max: 284.07), weather: [ WeatherData.Daily.Weather(icon: "10d") ])]
    
    static let sampleWeatherData = WeatherData(current: WeatherData.Current(dt: 1618317040, temp: 284.0, feels_like: 282.0, humidity: 62.0, wind_speed: 6.0, wind_deg: 300.0, weather: weathers), daily: dailies)
    
}
