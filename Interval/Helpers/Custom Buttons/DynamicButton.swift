//
//  DynamicButton.swift
//  Interval
//
//  Created by Neftali Samarey on 6/3/19.
//  Copyright © 2019 Neftali Samarey. All rights reserved.
//

import UIKit

class DynamicButton: UIButton {
    
    var baseFillColor = UIColor.TipiePink()
    
    
    // Property Observer
    override open var isHighlighted: Bool {
    
        didSet {
            backgroundColor = isHighlighted ? UIColor.init(hexString: "#cc1434") : UIColor.TipiePink()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func overrideDefaultBackgroundColorWith(_ fillColor: UIColor, _ selectionColor: UIColor) {
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
