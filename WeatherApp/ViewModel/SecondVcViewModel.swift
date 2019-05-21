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
    var weatherData: WeatherDataModel?
    
    // MARK: - Closure Declaration
    var selectedCityClosure: ((String) -> Void)?
    
    // MARK: - Global Variables
    let cities = ["Houston","Switzerland","California","Los Angeles","Dubai","London"]
    
    let weatherDictionary = [ "Houston" : 23,
                              "Switzerland" : -2,
                              "California" : 16,
                              "Los Angeles" : 20,
                              "Dubai" : 42,
                              "London" : 10,
                              ]
    
    //MARK: - Functions
    func setSelectedPlaceName(_ selection: String){
        weatherData?.city = selection
        weatherData?.temperature = weatherDictionary[selection]
    }
}
