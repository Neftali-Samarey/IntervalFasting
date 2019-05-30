//
//  TimeframeStackview.swift
//  Interval
//
//  Created by Neftali Samarey on 5/29/19.
//  Copyright © 2019 Neftali Samarey. All rights reserved.
//

import UIKit

class TimeframeStackview: UIView {

    var selectedOption = 0
    var buttonIdentifierDicionary = [UIButton: Int]() // use this to map ou the button
    
    
    // MARK: HOLDING VARIANLE FOR THE SELECTED TTIME FRAME
    private var currentSelectedButton = 0
    
    
    let eightHours      : UIButton
    let thirteenHours   : UIButton
    let sixteenHours    : UIButton
    let stackview : UIStackView
    
    let leftSpacing : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    let rightSpacing : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    override init(frame: CGRect) {
    
        // Image references
        
        
        // Initialize the UI properties
        eightHours = UIButton(type: .roundedRect)
        eightHours.setTitle("8 Hours", for: .normal)
        eightHours.translatesAutoresizingMaskIntoConstraints = false
        eightHours.tintColor = UIColor.gray
        eightHours.layer.borderWidth = 1
        eightHours.layer.cornerRadius = 7
        eightHours.layer.borderColor = UIColor.gray.cgColor
       // eightHours.titleEdgeInsets = UIEdgeInsets(top: 20.0, left: 30.0, bottom: 20.0, right: 30.0)
       

        thirteenHours = UIButton(type: .roundedRect)
        thirteenHours.translatesAutoresizingMaskIntoConstraints = false
        thirteenHours.setTitle("13 Hours", for: .normal)
        thirteenHours.tintColor = UIColor.gray
        thirteenHours.layer.borderWidth = 1
        thirteenHours.layer.cornerRadius = 7
        thirteenHours.layer.borderColor = UIColor.gray.cgColor
        
        sixteenHours = UIButton(type: .roundedRect)
        sixteenHours.translatesAutoresizingMaskIntoConstraints = false
        sixteenHours.setTitle("16 Hours", for: .normal)
        sixteenHours.tintColor = UIColor.gray
        sixteenHours.layer.borderWidth = 1
        sixteenHours.layer.cornerRadius = 7
        sixteenHours.layer.borderColor = UIColor.gray.cgColor
        
        // Increase the size for both left and right spacing views
        
        // Stackview
        stackview = UIStackView(arrangedSubviews: [eightHours, thirteenHours, sixteenHours])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.spacing = 5
        stackview.distribution = .fillEqually
        
        
        super.init(frame: frame)
        
        backgroundColor = UIColor.clear
        
        // set the dictionary
       
        
        addSubview(stackview)

        // Button width overrides
//        eightHours.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/3).isActive = true
//        thirteenHours.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/3).isActive = true
//        sixteenHours.widthAnchor.constraint(equalToConstant:UIScreen.main.bounds.width/3).isActive = true
        
        // MARK: - Constraints
        stackview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        stackview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        stackview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        stackview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        
        // Set the butttons to the dicttionary
        buttonIdentifierDicionary.updateValue(1, forKey: eightHours)
        
        // Targes
        eightHours.addTarget(self, action: #selector(TimeframeStackview.setEightHours), for: .touchUpInside)
        thirteenHours.addTarget(self, action: #selector(TimeframeStackview.setThirteenHours), for: .touchUpInside)
        sixteenHours.addTarget(self, action: #selector(TimeframeStackview.setSixteenHours), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        // Deallocate all objecs in this function
        print("Value left with \(currentSelectedButton)")
    }
    
    
    //
   
    
    // EIGHT HOURS
    @objc func setEightHours() { // Key is an Int, in this example it is 1
        print("Seleced button is 8 hours")
        currentSelectedButton = 1
    }
    
    @objc func setThirteenHours() { // Key is an Int, in this example it is 1
        print("Seleced button is 13 hours")
        currentSelectedButton = 2
    }
    
    @objc func setSixteenHours() { // Key is an Int, in this example it is 1
        print("Seleced button is 16 hours")
        currentSelectedButton = 3
    }
    
}

