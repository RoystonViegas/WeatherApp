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
    var customCellDataModelArray: [CustomCellDataModel]? //Holds Cells
    
    var selectedCell_InSecondVM: CustomCellDataModel? //Holds Selected Cell
    
    // MARK: - Closure Declaration
    var getCellDataClosure: ((CustomCellDataModel) -> Void)?
    
    //MARK: - Functions
    init() {
        
        let weatherData1 = WeatherDataModel(cityName:"Houston",cityTemperature: 31.0)
        let weatherData2 = WeatherDataModel(cityName:"Switzerland", cityTemperature: -6.0)
        let weatherData3 = WeatherDataModel(cityName:"California", cityTemperature: 10.0)
        let weatherData4 = WeatherDataModel(cityName:"Los Angeles", cityTemperature: 20.0)
        let weatherData5 = WeatherDataModel(cityName:"Dubai", cityTemperature: 48.7)
        
        let cellData1 = CustomCellDataModel(weatherDataModel: weatherData1)
        let cellData2 = CustomCellDataModel(weatherDataModel: weatherData2)
        let cellData3 = CustomCellDataModel(weatherDataModel: weatherData3)
        let cellData4 = CustomCellDataModel(weatherDataModel: weatherData4)
        let cellData5 = CustomCellDataModel(weatherDataModel: weatherData5)
        
        customCellDataModelArray = [cellData1,cellData2,cellData3,cellData4,cellData5]
    }
}
