//
//  LevelGauge.swift
//  Interval
//
//  Created by Neftali Samarey on 8/26/19.
//  Copyright © 2019 Neftali Samarey. All rights reserved.
//

import UIKit

class LevelGauge: UIView {
    
    private var currentLevel: Float = 0.0
    private var gaugeColor: UIColor!
    private var levelHeight : CGFloat = 0.0
    private var levelView: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupLevelGauge()
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLevelGauge() {
        levelView = UIView(frame: .zero)
    }
    
    // MARK: Public methods available to the client code*
    
    // Returns the current level of the gauge
    public func getGaugeLevel() -> Float {
        return currentLevel
    }
    
    // Updates the gauge level form the client code
    public func updateGaugeLevel(level: Float) {
        
    }
    
}
