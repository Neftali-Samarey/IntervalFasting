//
//  HorizontalControls.swift
//  Interval
//
//  Created by Neftali Samarey on 5/27/19.
//  Copyright © 2019 Neftali Samarey. All rights reserved.
//

import UIKit

class HorizontalControlStack: UIView {
    
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
    
    let baseView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.yellow
        view.layer.cornerRadius = 8
        return view
    }()
    
    let addNewFasting : UIButton
    let editFasting   : UIButton
    let deleteFasting : UIButton
    let stackview : UIStackView

    override init(frame: CGRect) {
        
      
        
        // Image references
        let addNewIcon = UIImage(named: "addNewFasting")
        let editIcon = UIImage(named: "editFasting")
        let deleteIcon = UIImage(named: "deleteFasting")
        
        // Initialize the UI properties
        addNewFasting = UIButton(type: .custom)
        addNewFasting.setImage(addNewIcon, for: .normal)
       
        
        editFasting = UIButton(type: .custom)
        editFasting.setImage(editIcon, for: .normal)
    
        
        deleteFasting = UIButton(type: .custom)
        deleteFasting.setImage(deleteIcon, for: .normal)
   
        
        // Increase the size for both left and right spacing views
       
        // Stackview
        stackview = UIStackView(arrangedSubviews: [leftSpacing, addNewFasting, editFasting, deleteFasting, rightSpacing])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.spacing = 0
        stackview.distribution = .equalSpacing

        
        super.init(frame: frame)
        
    
        backgroundColor = UIColor.white
        layer.cornerRadius = 7
        addSubview(stackview)
        
        // Button width overrides
        addNewFasting.widthAnchor.constraint(equalToConstant: 80).isActive = true
        editFasting.widthAnchor.constraint(equalToConstant: 80).isActive = true
        deleteFasting.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        // MARK: - Constraints
        stackview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        stackview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        stackview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        stackview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
