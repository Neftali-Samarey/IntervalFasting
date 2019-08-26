//
//  SettingsTableViewController.swift
//  Interval
//
//  Created by Neftali Samarey on 6/16/19.
//  Copyright © 2019 Neftali Samarey. All rights reserved.
//
// This is where the table will live for the momenr
import UIKit

class SettingsTableViewController: UITableViewController {
    
//    let settingsTableView : UITableView! = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        self.view.backgroundColor = UIColor.red
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), style: .grouped)

    }
    
    // MARK: - DISMISS CONTROL METHODS
    @IBAction func dismissController(_ sender: Any) {
        print("Clicked ...")
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    

  

}
