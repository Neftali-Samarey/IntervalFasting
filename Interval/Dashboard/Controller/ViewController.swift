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
    var horizontalControlStackview = HorizontalControlStack()
    let selectedFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    var slider : SliderView?
    var tapGestureRecognozer = UITapGestureRecognizer()
    
    // PREPARED STACKVIEW OF CONTROLS
   
    
    
//    var delegate : UpdateProgressBarDelegate? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedFeedbackGenerator.prepare()
        view.backgroundColor =  UIColor.init(red: 245/255, green: 246/255, blue: 250/255, alpha: 1.0)
        setupDashboardProgressbarView()
        setupStackview()
        progressBarview.delegate = self
        tapGestureRecognozer = UITapGestureRecognizer(target: self, action: #selector(self.slideViewDown))

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
//    let test = ["Something", "All good", "Keep it up"]
    
    // MARK : - UI INITIALIZAION
    private func setupDashboardProgressbarView() {
        
        view.addSubview(progressBarview)
        
//        for items in test.enumerated() {
//            self.progressBarview.progressBar.titleLabel.textWithAnimation(text: "\(items)", duration: 0.2)
//        }
        

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
    
    }
    
    
    // MARK: SETUP CONTROL STACK VIEW
    func setupStackview() {
        
        horizontalControlStackview.translatesAutoresizingMaskIntoConstraints = false
        horizontalControlStackview.addShadowing()

        progressBarview.addSubview(horizontalControlStackview)
        
        horizontalControlStackview.leadingAnchor.constraint(equalTo: progressBarview.leadingAnchor, constant: 10).isActive = true
        horizontalControlStackview.trailingAnchor.constraint(equalTo: progressBarview.trailingAnchor, constant: -10).isActive = true
        horizontalControlStackview.heightAnchor.constraint(equalToConstant: 60).isActive = true
        horizontalControlStackview.bottomAnchor.constraint(equalTo: progressBarview.bottomAnchor, constant: 30).isActive = true
        
        // Get the button's for set target actions
        horizontalControlStackview.addNewFasting.addTarget(self, action: #selector(ViewController.addNewFasting), for: .touchUpInside)
        horizontalControlStackview.editFasting.addTarget(self, action: #selector(ViewController.editFastingEntry), for: .touchUpInside)
        horizontalControlStackview.deleteFasting.addTarget(self, action: #selector(ViewController.deleteFastingEntry), for: .touchUpInside)

    }
    
    // MARK: UI DASHBOARD BUTTONS
    @objc func addNewFasting() {
        selectedFeedbackGenerator.impactOccurred()
        showSlider()
    }
    
    @objc func editFastingEntry() {
        selectedFeedbackGenerator.impactOccurred()
    }
    
    @objc func deleteFastingEntry() {
        selectedFeedbackGenerator.impactOccurred()
    }

    let sliderBackgroundView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6) // set hhe opacity
     
      //  view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: CREATION OF THE UIVIEW
    func showSlider() {
        
         slider = SliderView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2))
        slider?.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the animation the main thread
        
        if let masterSlider = slider {
            
            // Recognizer
            //sliderBackgroundView.addGestureRecognizer(tapGestureRecognozer)
            // Set the subviews
            view.addSubview(sliderBackgroundView)
            sliderBackgroundView.alpha = 0
            sliderBackgroundView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            UIView.animate(withDuration: 0.3) {
                self.sliderBackgroundView.alpha = 1
            }
            
            // Now continue to then slide the card into place
            sliderBackgroundView.addSubview(masterSlider)

            masterSlider.topAnchor.constraint(equalTo: progressBarview.progressBar.topAnchor, constant: 0).isActive = true
            masterSlider.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
            masterSlider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
            
            // UI Controls
            masterSlider.dynamicButton.addTarget(self, action: #selector(self.beginFastingAction), for: .touchUpInside)

        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
    }

    
    // MARK: SLIDE METHOD DOWN
    @objc func slideViewDown() {
        
        if let slider = slider {
            
            slider.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    
            UIView.animate(withDuration: 0.2, animations: {
                
                // Slide the view down below the bottom anchor of the main view
                slider.center = CGPoint(x: self.view.center.x, y: self.view.frame.height + self.slider!.frame.height/2)
                self.view.layoutIfNeeded()
                self.sliderBackgroundView.alpha = 0
            }, completion: { (s) in
                
                slider.removeFromSuperview()
                self.sliderBackgroundView.removeFromSuperview()
                self.slider = nil
            })
            
        }

        
        
    }
    
    // MARK: UI CONTROLS
    @objc func beginFastingAction() {
        print("Beginning ...")
        slideViewDown()
    }
    
    
    
    // Method callback is workign in this section
    @objc func updateUIprogressBar() {
        print("Invoking a test ...")
    }
}


extension ViewController : UpdateProgressBarDelegate {
    // MARK: - PROGRESS BAR DELEGATE
    func updateWithValue() -> CGFloat {
        return 93.0
    }
}
