//
//  Date+Extension.swift
//  WeatherApp
//
//  Created by xavier bohin on 03/02/2022.
//

import Foundation

extension Date {
    
    func getString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let day = dateFormatter.string(from: self)
        return day
    }
    
}
