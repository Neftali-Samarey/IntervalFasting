//
//  SettingsTableViewController.swift
//  Interval
//
//  Created by Neftali Samarey on 6/16/19.
//  Copyright © 2019 Neftali Samarey. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"

    }
    
    // MARK: - DISMISS CONTROL METHODS
    @IBAction func dismissController(_ sender: Any) {
        print("Clicked ...")
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source


  

}
