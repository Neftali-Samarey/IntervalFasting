//
//  DynamicButton.swift
//  Interval
//
//  Created by Neftali Samarey on 6/3/19.
//  Copyright © 2019 Neftali Samarey. All rights reserved.
//

import UIKit


extension UIButton {
    
    // Set the rounding of the main corner edges
    func roundEdges() {
        self.layer.cornerRadius = 7
    }
}

class DynamicButton: UIButton {

    // Default colors
    var baseFillColor : UIColor
    var highlightColor : UIColor
    
    // Property Observer
    override open var isHighlighted: Bool {
       
        didSet {
            backgroundColor = isHighlighted ? highlightColor : baseFillColor
           // backgroundColor = isHighlighted ? UIColor.init(hexString: "#cc1434") : UIColor.TipiePink()
        }
    }
    
    override init(frame: CGRect) {
    
        // Init these default values
        baseFillColor = UIColor.TipiePink()
        highlightColor = UIColor.init(hexString: "#cc1434")
        
        super.init(frame: frame)
    }
    
    // Override and initialize with a color
    convenience init(defaultColor: UIColor,  highlightedColor: UIColor) {
        
        self.init()
        self.baseFillColor = defaultColor
        self.highlightColor = highlightedColor

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
