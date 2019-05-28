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

class SliderView : UIView {
    
    let mainBackground : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewTitle : UILabel = {
        let label = UILabel()
        label.text = "New Goal"
        label.textColor = UIColor.gray
        label.font = UIFont(name: "Roboto-Medium", size: 25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dynamicButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Start", for: .normal)
        button.backgroundColor = UIColor.init(hexString: "#07A448")
        button.layer.cornerRadius = 6
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
        self.layer.cornerRadius = 12
        self.backgroundColor = UIColor.init(red: 245/255, green: 246/255, blue: 250/255, alpha: 1.0)
        
        setTopLayout()
        setButtonLayout()
        setupBackgroundView()
    }
    
    private func setupBackgroundView() {
        self.addSubview(mainBackground)
        self.sendSubviewToBack(mainBackground)
        // background size will be adjusted to by the caller
       // mainBackground.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    private func setTopLayout() {
        self.addSubview(viewTitle)
        
        self.viewTitle.textAlignment = .center
        
        self.viewTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        self.viewTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 25).isActive = true
        self.viewTitle.widthAnchor.constraint(equalToConstant: self.bounds.width - 20).isActive = true
        self.viewTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setButtonLayout() {
        self.addSubview(dynamicButton)
        DispatchQueue.main.async {
            self.dynamicButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
            self.dynamicButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            self.dynamicButton.widthAnchor.constraint(equalToConstant: self.bounds.width - 30).isActive = true
            self.dynamicButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40).isActive = true
        }
    }
    
}
