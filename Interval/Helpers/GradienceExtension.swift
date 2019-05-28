//
//  GradienceExtension.swift
//  Interval
//
//  Created by Neftali Samarey on 5/23/19.
//  Copyright © 2019 Neftali Samarey. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    // Adds gradient color to the given view
    func addGradientWithColors(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func addGradientWithThreeColors(topColor: UIColor, middle: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [topColor.cgColor, middle.cgColor, bottomColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.9)// top y-axis
        gradient.endPoint = CGPoint(x: 0.0, y: -1.2) // Bottom y-axis
    
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func addShadowing() {
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.masksToBounds = false;
        self.layer.shadowRadius = 2;
        self.layer.shadowOpacity = 0.3;
    }
    
}
