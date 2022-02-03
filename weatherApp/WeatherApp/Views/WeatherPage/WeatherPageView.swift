//
//  WeatherPageView.swift
//  weatherApp
//
//  Created by xavier bohin on 02/02/2022.
//

import SwiftUI

struct WeatherPageView: View {
    
    var city: City
    @State private var selectedMode : weatherMode = .current
    @State private var viewModel = WeatherPageViewModel()
    
    var body: some View {
        VStack() {
            Picker("choose mode", selection: $selectedMode) {
                ForEach(weatherMode.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            switch selectedMode {
            case .current:
                WeatherCurrentView(data: viewModel.weatherData)
            case .forecast:
                WeatherForecastView(data: viewModel.weatherData)
            }
            
            Spacer()
        }
        .navigationTitle(city.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear() {
            viewModel.getWeather(lat: city.lat , lon: city.lon)
        }
        
    }
}

enum weatherMode: String, CaseIterable {
    case current = "Current"
    case forecast = "Forecast"
}


struct WeatherPageView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherPageView(city: MockData.sampleCity)
    }
}
