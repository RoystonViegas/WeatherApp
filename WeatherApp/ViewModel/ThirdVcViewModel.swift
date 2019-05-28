//
//  ThirdVcViewModel.swift
//  WeatherApp
//
//  Created by Royston Viegas on 28/05/19.
//  Copyright © 2019 Royston Viegas. All rights reserved.
//

import Foundation

class ThirdVcViewModel{
    
    var customCellData : CustomCellDataModel?
    
    //CLOSURE DECLARE
    var addedDataClosure : ((CustomCellDataModel) -> Void)?
    
    func setData(_ city: String, _ temp: Float){
        let weatherData = WeatherDataModel(cityName: city, cityTemperature: temp)
        customCellData = CustomCellDataModel(weatherDataModel: weatherData)
    }
}
