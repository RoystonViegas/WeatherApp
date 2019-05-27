//
//  SecondViewController.swift
//  POC-Project
//
//  Created by Royston Viegas on 14/05/19.
//  Copyright © 2019 Royston Viegas. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Instance Variables
    var secondViewModel = SecondVcViewModel()
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Screen 1"
        tableView.delegate = self
        tableView.dataSource = self
        setDefaultsOnLoad()
    }
    
    func setDefaultsOnLoad(){
        tableView.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherCell")
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backButtonClicked))
    }
    
    // DONE Navigation Button
    @objc func backButtonClicked(sender: UIBarButtonItem){
        
        guard let selectedCellData = secondViewModel.selectedCell_InSecondVM else{
            print("Select any country")
            return
        }
        
        //CLOSURE CALL
        secondViewModel.getCellDataClosure?(selectedCellData)
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let noOfRows = secondViewModel.customCellDataModelArray?.count else { return 0 }
        return noOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherTableViewCell {
            
            cell.accessoryType = .none
            
            let cellModelArrayValue = secondViewModel.customCellDataModelArray?[indexPath.row]
            
            cell.placeTitleLabel.text = cellModelArrayValue?.cityName
            
            if let selectedCell = secondViewModel.selectedCell_InSecondVM{
                if selectedCell.cityName == cellModelArrayValue?.cityName{
                    cell.accessoryType = .checkmark
                }
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            guard let customCellDataModelArrayValue = secondViewModel.customCellDataModelArray?[indexPath.row] else {
                return
            }
            
            if  secondViewModel.selectedCell_InSecondVM?.cityName == customCellDataModelArrayValue.cityName{
                
                secondViewModel.selectedCell_InSecondVM = nil
            }
            else{
                secondViewModel.selectedCell_InSecondVM = customCellDataModelArrayValue
            }
            tableView.reloadData()
        }
}
