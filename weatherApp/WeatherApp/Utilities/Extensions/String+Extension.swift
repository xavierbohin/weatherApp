//
//  String+Extension.swift
//  WeatherApp
//
//  Created by xavier bohin on 04/02/2022.
//

import Foundation

extension String {
    
    func localized() -> String {
        return NSLocalizedString(self, comment: self)
    }
    
}
