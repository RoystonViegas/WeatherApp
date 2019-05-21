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
    var viewModel = SecondVcViewModel()
    
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
    }
    
    // MARK: - TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherTableViewCell {
            cell.accessoryType = .none
            
            cell.placeTitleLabel.text = viewModel.cities[indexPath.row]
 
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? WeatherTableViewCell{
            
            guard let cellTitle = cell.placeTitleLabel.text else{
                return
            }
            
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
            }else{
                cell.accessoryType = .checkmark
                
                //Closure Call
                if let closureCall = viewModel.selectedCityClosure {
                    closureCall(cellTitle)
                }
                
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
