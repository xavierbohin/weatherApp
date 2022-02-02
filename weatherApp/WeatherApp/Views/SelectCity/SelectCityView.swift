//
//  SelectCityView.swift
//  weatherApp
//
//  Created by xavier bohin on 02/02/2022.
//

import SwiftUI

struct SelectCityView: View {
    
    @State private var cityName: String = ""
    @StateObject private var viewModel = SelectCityViewModel()
    
    var body: some View {
        VStack() {
            Text("Enter city name")
                .padding()
            
            TextField("Search", text: $cityName)
                .onChange(of: cityName) {
                    viewModel.getCities(cityName: $0)
                }
                .padding(.leading)
                .padding(.bottom)
                        
            VStack(spacing: 30) {
                ForEach(viewModel.cities){ city in
                    Text(city.name + ", \(city.country), (\(city.lat), \(city.lon))")
                }
            }
            
            Spacer()
            
        }
    }
}

struct SelectCityView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCityView()
            .previewDevice("iPhone 13 Pro")
    }
}
