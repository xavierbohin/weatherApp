//
//  WeatherForecastView.swift
//  WeatherApp
//
//  Created by xavier bohin on 03/02/2022.
//

import SwiftUI

struct WeatherForecastView: View {
    
    var data : WeatherData?
    
    var body: some View {
        if let data = data {
            List(data.daily) { daily in
                HStack() {
                    Spacer()
                    WeatherCell(daily: daily).padding()
                    Spacer()
                }
            }
        } else {
            LoadingView()
        }
    }
}

struct WeatherForecastView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecastView(data: MockData.sampleWeatherData)
    }
}
