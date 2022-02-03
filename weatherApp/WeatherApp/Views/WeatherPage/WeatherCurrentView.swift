//
//  WeatherCurrentView.swift
//  WeatherApp
//
//  Created by xavier bohin on 03/02/2022.
//

import SwiftUI

struct WeatherCurrentView: View {
    
    var data : WeatherData?
    
    var body: some View {
        if let data = data {
            VStack(spacing: 10) {
                Text(Date(timeIntervalSince1970: data.current.dt).getString(format: "EEEE"))
                Text(Date(timeIntervalSince1970: data.current.dt).getString(format: "H:mm"))
                Text(data.current.weather.first?.description ?? "")
                WeatherRemoteImage(iconString: data.current.weather.first?.icon ?? "10d")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
                Text("temperature : \(Int(data.current.temp)) k")
                Text("feels like : \(Int(data.current.feels_like)) k")
                Text("humidity : \(Int(data.current.humidity)) %")
                Text("wind speed : \(Int(data.current.wind_speed)) m/s. direction : \(Int(data.current.wind_deg)) °")
            }
        } else {
            LoadingView()
        }
        
    }
}

struct WeatherCurrentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCurrentView(data: MockData.sampleWeatherData)
    }
}
