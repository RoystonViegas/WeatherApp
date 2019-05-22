//
//  WeatherViewModel.swift
//  POC-Project
//
//  Created by Royston Viegas on 16/05/19.
//  Copyright © 2019 Royston Viegas. All rights reserved.
//

import Foundation

class SecondVcViewModel{
    
    // MARK: - Instance Variabls
    var weatherCellModel: [WeatherCellModel]?
    
    // MARK: - Closure Declaration
    var weatherDataClosure: ((WeatherCellModel) -> Void)?
    
    //MARK: - Functions
    init() {
        
        let weatherModel1 = WeatherDataModel(cityName:"Houston",cityTemperature: 31.0)
        let weatherModel2 = WeatherDataModel(cityName:"Switzerland", cityTemperature: -6.0)
        let weatherModel3 = WeatherDataModel(cityName:"California", cityTemperature: 10.0)
        let weatherModel4 = WeatherDataModel(cityName:"Los Angeles", cityTemperature: 20.0)
        let weatherModel5 = WeatherDataModel(cityName:"Dubai", cityTemperature: 48.7)
        
        let cellModel1 = WeatherCellModel(weatherDataModel: weatherModel1)
        let cellModel2 = WeatherCellModel(weatherDataModel: weatherModel2)
        let cellModel3 = WeatherCellModel(weatherDataModel: weatherModel3)
        let cellModel4 = WeatherCellModel(weatherDataModel: weatherModel4)
        let cellModel5 = WeatherCellModel(weatherDataModel: weatherModel5)
        
        weatherCellModel = [cellModel1,cellModel2,cellModel3,cellModel4,cellModel5]
    }
}
