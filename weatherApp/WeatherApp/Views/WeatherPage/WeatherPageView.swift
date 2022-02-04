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
    @StateObject private var viewModel = WeatherPageViewModel()
    
    var body: some View {
        ZStack {
            VStack() {
                Picker("choose mode", selection: $selectedMode) {
                    ForEach(weatherMode.allCases, id: \.self) {
                        Text($0.rawValue.localized())
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
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
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
