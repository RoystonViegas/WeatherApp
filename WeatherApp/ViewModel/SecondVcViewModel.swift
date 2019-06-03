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
    let data = DummyDataManager.shared
    
    var customCellDataModelArray: [CustomCellDataModel]? //Holds Cells
    
    var selectedCell_InSecondVM: CustomCellDataModel? //Holds Selected Cell
    
    // MARK: - Closure Declaration
    var getCellDataClosure: ((CustomCellDataModel) -> Void)?
    
    //MARK: - Functions
    init() {
        customCellDataModelArray = data.customCellDataModelArray
    }
}
