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
    var viewModel : FirstVcViewModel?
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Weather Report"
        viewModel = FirstVcViewModel()
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
        let lbl = UILabel(frame: CGRect(x: 95, y: 110, width: 200, height: 200))
        lbl.text = "22"
        lbl.textColor = UIColor.darkGray
        lbl.textAlignment = NSTextAlignment.center
        lbl.font = lbl.font.withSize(150)
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
        btn.setTitle("Choose a Place", for: .normal)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.tag = 1
        return btn
    }()
    
    let button2: UIButton = {
        let btn2 = UIButton(frame: CGRect(x: 140, y: 720, width: 100, height: 50))
        btn2.backgroundColor = UIColor.red
        btn2.setTitle("Dummy", for: .normal)
        btn2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn2.tag = 2
        return btn2
    }()
    
    // MARK: - Actions
    @objc func buttonAction(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            
            let secondVC = SecondViewController()
            
            //Closure Implementation
            secondVC.viewModel.selectedCityClosure = { [weak self] value in
                self?.cityLabel.text = value
            }
            
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }
}
