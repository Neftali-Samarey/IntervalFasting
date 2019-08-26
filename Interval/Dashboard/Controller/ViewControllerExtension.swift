//
//  ViewControllerExtension.swift
//  Interval
//
//  Created by Neftali Samarey on 6/30/19.
//  Copyright © 2019 Neftali Samarey. All rights reserved.
//

import Foundation
import UIKit



extension ViewController {
    
    @objc func showEditController() {
        print("Called extended edit button")
        selectedFeedbackGenerator.impactOccurred()
    }
    
    // MARK: TEST METHOD (not in use)
    @objc func saveDataWith() {
        print("Saving data on queue")
        slideDownWithExpression()
    }
}
