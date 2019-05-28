//
//  FirstViewController.swift
//  POC-Project
//
//  Created by Royston Viegas on 09/05/19.
//  Copyright © 2019 Royston Viegas. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController{
    
    // MARK: - Instance Variables
    var firstViewModel : FirstVcViewModel?
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Weather Report"
        firstViewModel = FirstVcViewModel()
        displayUIElements()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func displayUIElements(){
        view.addSubview(temperatureLabel)
        view.addSubview(cityLabel)
        view.addSubview(button1)
        view.addSubview(button2)
    }
    
    // MARK: - IBOutlets / UIElements
    let temperatureLabel: UILabel = {
        let lbl = UILabel(frame: CGRect(x: -55, y: 110, width: 500, height: 200))
        lbl.text = "22"
        lbl.textColor = UIColor.darkGray
        lbl.textAlignment = NSTextAlignment.center
        lbl.font = lbl.font.withSize(100)
        return lbl
    }()
    
    let cityLabel: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 95, y: 300, width: 200, height: 50))
        lbl.text = "Place Name"
        lbl.textColor = UIColor.lightGray
        lbl.textAlignment = NSTextAlignment.center
        lbl.font = lbl.font.withSize(17)
        return lbl
    }()
    
    let button1: UIButton = {
        let btn = UIButton(frame: CGRect(x: 115, y: 650, width: 150, height: 50))
        btn.backgroundColor = UIColor.blue
        btn.setTitle("Change Location", for: .normal)
        btn.addTarget(self, action: #selector(selectLocation), for: .touchUpInside)
        btn.tag = 1
        return btn
    }()
    
    let button2: UIButton = {
        let btn2 = UIButton(frame: CGRect(x: 140, y: 720, width: 100, height: 50))
        btn2.backgroundColor = UIColor.red
        btn2.setTitle("Dummy", for: .normal)
        btn2.addTarget(self, action: #selector(selectLocation), for: .touchUpInside)
        btn2.tag = 2
        return btn2
    }()
    
    // MARK: - Actions
    @objc func selectLocation(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            
            let secondVC = SecondViewController()
            
            secondVC.secondViewModel.selectedCell_InSecondVM = firstViewModel?.selectedCell_InFirstVM
            
            //Closure Implementation
            secondVC.secondViewModel.getCellDataClosure = { [weak self] customCellDataModel in
                
                self?.firstViewModel?.selectedCell_InFirstVM = customCellDataModel
                
                self?.cityLabel.text = customCellDataModel.cityName

                if let temperature = customCellDataModel.cityTemperature {
                    self?.temperatureLabel.text = String(temperature)
                }
            }
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }
}
