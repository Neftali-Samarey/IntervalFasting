//
//  Extensions.swift
//  Interval
//
//  Created by Neftali Samarey on 5/28/19.
//  Copyright © 2019 Neftali Samarey. All rights reserved.
//

import Foundation
import UIKit


extension UILabel {
    
    func animation(typing value:String,duration: Double){
        let characters = value.map { $0 }
        var index = 0
        
        Timer.scheduledTimer(withTimeInterval: duration, repeats: true, block: { [weak self] timer in
            if index < value.count {
                let char = characters[index]
                self?.text! += "\(char)"
                index += 1
            } else {
                timer.invalidate()
            }
        })
    }
    
    
    func textWithAnimation(text:String,duration:CFTimeInterval){
        fadeTransition(duration)
        self.text = text
    }
    
    //followed from @Chris and @winnie-ru
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}


extension SliderView {
    public func slideIn() {
        
    }
    
    public func slideOut() {
        
    }
}

