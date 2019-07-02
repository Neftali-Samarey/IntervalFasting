//
//  TimeframeStackview.swift
//  Interval
//
//  Created by Neftali Samarey on 5/29/19.
//  Copyright © 2019 Neftali Samarey. All rights reserved.
//

import UIKit

//protocol timeframeToParentDelegate {
//    func dataToSend(timeSelected: Int)
//}

protocol SelectedValueDelegate {
    var selectedIndex : Int { get set } // Get the index value
}

class TimeframeStackview: UIView {
    
    var delegate : SelectedValueDelegate? = nil

    var selectedOption = 0
    var buttonIdentifierDicionary = [UIButton: Int]() // use this to map ou the button
    
//    var delegate : timeframeToParentDelegate? = nil
    
    // MARK: GLOBAL HOLDING VARIABLE FOR THE SELECTED TTIME FRAME
    public var currentSelectedButton = 0
    
    
    let eightHours      : UIButton
    let thirteenHours   : UIButton
    let sixteenHours    : UIButton
    let stackview : UIStackView
    
    let timeFrameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Roboto-Medium", size: 21.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    
    override init(frame: CGRect) {
    
        // Image references
    
        // Initialize the UI properties
        eightHours = UIButton(type: .roundedRect)
        eightHours.setTitle("8 Hours", for: .normal)
        eightHours.translatesAutoresizingMaskIntoConstraints = false
        eightHours.tintColor = UIColor.black
        eightHours.layer.borderWidth = 1
        eightHours.layer.cornerRadius = 7
        eightHours.layer.borderColor = UIColor.black.cgColor
       // eightHours.titleEdgeInsets = UIEdgeInsets(top: 20.0, left: 30.0, bottom: 20.0, right: 30.0)
       

        thirteenHours = UIButton(type: .roundedRect)
        thirteenHours.translatesAutoresizingMaskIntoConstraints = false
        thirteenHours.setTitle("13 Hours", for: .normal)
        thirteenHours.tintColor = UIColor.black
        thirteenHours.layer.borderWidth = 1
        thirteenHours.layer.cornerRadius = 7
        thirteenHours.layer.borderColor = UIColor.black.cgColor
        
        sixteenHours = UIButton(type: .roundedRect)
        sixteenHours.translatesAutoresizingMaskIntoConstraints = false
        sixteenHours.setTitle("16 Hours", for: .normal)
        sixteenHours.tintColor = UIColor.black
        sixteenHours.layer.borderWidth = 1
        sixteenHours.layer.cornerRadius = 7
        sixteenHours.layer.borderColor = UIColor.black.cgColor
        
        // Increase the size for both left and right spacing views
        
        // Stackview
        stackview = UIStackView(arrangedSubviews: [eightHours, thirteenHours, sixteenHours])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.spacing = 5
        stackview.distribution = .fillEqually
        
       
        // MARK: INITIALIZED PROPERTIES BEFORE THIS CALL TO SUPER CLASS *****
        /*
         A designated initializer is the primary initializer for a class.
         It must fully initialize all properties introduced by its class
         before calling a superclass initializer. (ie right below **)
         */
        
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
        
        addSubview(timeFrameLabel)
        
        
        // TODO: Animate this into place
        timeFrameLabel.bottomAnchor.constraint(equalTo: stackview.topAnchor, constant: -20).isActive = true
        timeFrameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        timeFrameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        timeFrameLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        // These sets the label to the bottom of the timeframe buttons
        
//        timeFrameLabel.topAnchor.constraint(equalTo: stackview.bottomAnchor, constant: 15).isActive = true
//        timeFrameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
//        timeFrameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
//        timeFrameLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        
        // Set the butttons to the dicttionary
        buttonIdentifierDicionary.updateValue(1, forKey: eightHours)
        
        
        //TODO: MOVE THEM TO THEIR PARENT
        // Targes (maybe moving them to their parent)
        
        /*
        eightHours.addTarget(self, action: #selector(TimeframeStackview.setEightHours), for: .touchUpInside)
        thirteenHours.addTarget(self, action: #selector(TimeframeStackview.setThirteenHours), for: .touchUpInside)
        sixteenHours.addTarget(self, action: #selector(TimeframeStackview.setSixteenHours), for: .touchUpInside) */
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    deinit {
//        // Deallocate all objecs in this function
//        print("Value left with \(currentSelectedButton)")
//    }
 

    // Upon selection of the buttons, enable them to be colored or filled, if other buttons are selected, previous button is deselected
    var isButtonSelected = false
    
    func updateSelectionMade(selection: Int) {
        switch selection {
        case 1:
            self.timeFrameLabel.text = "Your target goal is 8 hours"
//            delegate?.dataToSend(timeSelected: selection)       // Needs to send a timer, not an index
        case 2:
             self.timeFrameLabel.text = "Your target goal is 13 hours"
//            delegate?.dataToSend(timeSelected: selection)        // Needs to send a timer, not an index
        case 3:
             self.timeFrameLabel.text = "Your target goal is 16 hours"
//            delegate?.dataToSend(timeSelected: selectedOption)      // Needs to send a timer, not an index
        default:
            return
        }
    }
    
    // EIGHT HOURS
//    @objc func setEightHours() { // Key is an Int, in this example it is 1
//        print("Seleced button is 8 hours")
//        currentSelectedButton = 1
//        updateSelectionMade(selection: currentSelectedButton)
//
//    }
//
//    @objc func setThirteenHours() { // Key is an Int, in this example it is 1
//        print("Seleced button is 13 hours")
//        currentSelectedButton = 2
//        updateSelectionMade(selection: currentSelectedButton)
//    }
//
//    @objc func setSixteenHours() { // Key is an Int, in this example it is 1
//        print("Seleced button is 16 hours")
//        currentSelectedButton = 3
//        updateSelectionMade(selection: currentSelectedButton)
//       // delegate?.selectedValue(userSelectedInput: currentSelectedButton)
//        delegate?.selectedIndex = currentSelectedButton
//
//    }
    
    
    
    
}

