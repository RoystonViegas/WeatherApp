//
//  WeatherTableViewCell.swift
//  POC-Project
//
//  Created by Royston Viegas on 16/05/19.
//  Copyright © 2019 Royston Viegas. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var placeTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: true)
    }
}

class CustomCellDataModel{
    
    var cityName: String?
    var cityTemperature: Float?
    
    init( weatherDataModel: WeatherDataModel) {
        cityName = weatherDataModel.city
        cityTemperature = weatherDataModel.temperature
    }
}
