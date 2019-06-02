//
//  SliderView.swift
//  Interval
//
//  Created by Neftali Samarey on 5/28/19.
//  Copyright © 2019 Neftali Samarey. All rights reserved.
//

import Foundation
import UIKit

enum EntryType {
    case New
    case Edit
}

protocol getSliderSelectionDataDelegate {
    func dataFromSliderControllerWith(test: Int)
}

class SliderView : UIView {
    
    
    // Delegate
    var delegate : getSliderSelectionDataDelegate? = nil
    
    
    // MARK: UI PROPERTIES
    let timeframeButtons = TimeframeStackview()
    
    let mainBackground : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewTitle : UILabel = {
        let label = UILabel()
        label.text = "New Goal"
        label.textColor = UIColor.init(hexString: "#383838")
        label.layer.backgroundColor = UIColor.clear.cgColor
        label.font = UIFont(name: "Roboto-Medium", size: 22.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dynamicButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 23.0)
        button.backgroundColor = UIColor.turquoiseColor()
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let closeButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "close"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setTopLayout()
        setButtonLayout()
        setupBackgroundView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 15
        self.backgroundColor = UIColor.init(red: 245/255, green: 246/255, blue: 250/255, alpha: 1.0)
        
        setTopLayout()
        setButtonLayout()
        setupBackgroundView()
    }
    
    deinit {
        print("Parent level data left with: \(getTimeframeSelectedIndex())")
    }
    
    
    private func setupBackgroundView() {
        self.addSubview(mainBackground)
        self.sendSubviewToBack(mainBackground)
        // background size will be adjusted to by the caller
       // mainBackground.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    private func setTopLayout() {
        
        timeframeButtons.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(closeButton)
        self.addSubview(viewTitle)
        self.addSubview(timeframeButtons)
        
      
        
        // Close button
        self.closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        self.closeButton.widthAnchor.constraint(equalToConstant: 52).isActive = true
        self.closeButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        self.closeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        
        // Middle layout (buttons)
        self.timeframeButtons.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 30).isActive = true
        self.timeframeButtons.heightAnchor.constraint(equalToConstant: self.bounds.height/5).isActive = true
        self.timeframeButtons.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        self.timeframeButtons.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        
        // Label title
        
        self.viewTitle.textAlignment = .center
        
        self.viewTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        self.viewTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 25).isActive = true
        self.viewTitle.widthAnchor.constraint(equalToConstant: self.bounds.width - 20).isActive = true
        self.viewTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
   
    
    private func setButtonLayout() {
        self.addSubview(dynamicButton)
        
      //  dynamicButton.addTarget(self, action: #selector(SliderView.comfirmAllDatapoints), for: .touchUpInside)
        
        DispatchQueue.main.async {
            self.dynamicButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
            self.dynamicButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            self.dynamicButton.widthAnchor.constraint(equalToConstant: self.bounds.width - 30).isActive = true
            self.dynamicButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40).isActive = true
        }
    }
    
    // MARK: Gets the index (1, 2, 3) from the timeframe view itself. Getter only
    func getTimeframeSelectedIndex() -> Int {
        return timeframeButtons.currentSelectedButton
    }
    
    
    // MARK: Method for the button to then pass this data backt to the main controller
    @objc func comfirmAllDatapoints() {
        delegate?.dataFromSliderControllerWith(test: getTimeframeSelectedIndex())
    }
    
}
