//
//  ViewController.swift
//  Interval
//
//  Created by Neftali Samarey on 5/23/19.
//  Copyright © 2019 Neftali Samarey. All rights reserved.
//

import UIKit

// Any child view adhering to this protocol will inherit or get data from parent view
//protocol updateChildViewDelegate {
//    func updateDashboardWithCurrentData(current: CGFloat)
//}

class ViewController: UIViewController {

    var progressBarview = ProgressbarParentView()
    var gradientViewLayer = UIView()
    
//    var delegate : UpdateProgressBarDelegate? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  UIColor.init(red: 245/255, green: 246/255, blue: 250/255, alpha: 1.0)
        setupDashboardProgressbarView()
        progressBarview.delegate = self
        testButton()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK : - UI INITIALIZAION
    private func setupDashboardProgressbarView() {
        
        view.addSubview(progressBarview)

        // Constraints
        progressBarview.heightAnchor.constraint(equalToConstant: self.view.bounds.height/2).isActive = true
        progressBarview.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        progressBarview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        progressBarview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       setupLayer()
    }
    
    // Gradient workaround layer on top of the progressBarView
    private func setupLayer() {
        
        gradientViewLayer.frame = progressBarview.bounds //DD465F
        gradientViewLayer.addGradientWithThreeColors(topColor: UIColor.init(hexString: "#FF0E21"), middle: UIColor.init(hexString: "#DD465F"), bottomColor: UIColor.init(hexString: "#FCB3C5"))
        //gradientViewLayer.addGradientWithColors(topColor: UIColor.init(hexString: "#FF0E21"), bottomColor: UIColor.init(hexString: "#FCB3C5"))
        progressBarview.addSubview(gradientViewLayer)
        
        // Workaround. Taking the progressBarView instance and sending its child to its back. Then showing it by setting itself to clear
        progressBarview.backgroundColor = .clear
        progressBarview.sendSubviewToBack(gradientViewLayer)
        
        // test
    }

    func testButton() {
        let button = UIButton(frame: CGRect(x: 100, y: 450, width: 100, height: 30 ))
        button.setTitle("Update", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(self.updateUIprogressBar), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func updateUIprogressBar() {
        print("Invoking a test ...")
        progressBarview.progressBar.setProgress(progress: 60.0, animated: true)
       // Test the given value
    }
}

extension ViewController : UpdateProgressBarDelegate {
    // MARK: - PROGRESS BAR DELEGATE
    func updateWithValue() -> CGFloat {
        return 93.0
    }
}
