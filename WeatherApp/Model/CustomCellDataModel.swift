//
//  CustomCellDataModel.swift
//  WeatherApp
//
//  Created by Royston Viegas on 03/06/19.
//  Copyright © 2019 Royston Viegas. All rights reserved.
//

import Foundation

class CustomCellDataModel{
    
    var cityName: String?
    var cityTemperature: Float?
    var id: String?
    
    init( weatherDataModel: WeatherDataModel) {
        id = UUID().uuidString
        cityName = weatherDataModel.city
        cityTemperature = weatherDataModel.temperature
    }
}
