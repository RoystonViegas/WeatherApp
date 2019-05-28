//
//  ThirdViewController.swift
//  WeatherApp
//
//  Created by Royston Viegas on 28/05/19.
//  Copyright © 2019 Royston Viegas. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var temperatureTextField: UITextField!
    
    let thirdViewModel = ThirdVcViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarButtons()
    }
    
    func setupNavigationBarButtons(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButton))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButton))
    }
    
    //CANCEL BUTTON
    @objc func cancelButton(){
        navigationController?.popViewController(animated: true)
    }
    
    //DONE BUTTON
    @objc func doneButton(){
        guard let cityName = cityNameTextField.text, let temperature = temperatureTextField.text else {
           return
        }
        
        if let temp = Float(temperature){
            thirdViewModel.setData(cityName, temp)
        }
        
        guard let newCustomCell = thirdViewModel.customCellData else {
            return
        }
        
        //CLOSURE CALL
        thirdViewModel.addedDataClosure?(newCustomCell)
        self.navigationController?.popViewController(animated: true)
    }
}
