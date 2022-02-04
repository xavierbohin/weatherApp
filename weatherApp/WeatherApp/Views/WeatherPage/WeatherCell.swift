//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by xavier bohin on 03/02/2022.
//

import SwiftUI

struct WeatherCell: View {
    
    var daily: WeatherData.Daily
    
    var body: some View {
        VStack() {
            Text(Date(timeIntervalSince1970: daily.dt).getString(format: "EE"))
            WeatherRemoteImage(iconString: daily.weather.first?.icon ?? "10d")
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            Text("min temperature : ".localized() + "\(Int(daily.temp.min)) k")
            Text("max temperature : ".localized() + "\(Int(daily.temp.max)) k")
        }
    }
}

struct WeatherCell_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCell(daily: MockData.sampleWeatherData.daily.first!)
    }
}
