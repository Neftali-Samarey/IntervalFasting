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

class ViewController: UIViewController, getSliderSelectionDataDelegate {
   
    

    var progressBarview = ProgressbarParentView()
    var gradientViewLayer = UIView()
    var horizontalControlStackview = HorizontalControlStack()
    let selectedFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    var slider : SliderView?
    var tapGestureRecognozer = UITapGestureRecognizer()
    
    var stopButton = DynamicButton()
    
    var isCurrentlyFasting = true
    
    
   
    
    
//    var delegate : UpdateProgressBarDelegate? = nil
    
    func createReferenceFromParentProgressbarControls() {
        progressBarview.settingsButton.addTarget(self, action: #selector(self.launchSettingsView), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedFeedbackGenerator.prepare()
        view.backgroundColor =  UIColor.init(red: 245/255, green: 246/255, blue: 250/255, alpha: 1.0)
        setupDashboardProgressbarView()
        createReferenceFromParentProgressbarControls()
        setupStackview()
        progressBarview.delegate = self
        setStopButton()
        tapGestureRecognozer = UITapGestureRecognizer(target: self, action: #selector(self.slideViewDown))
    
    }
    
    @objc func launchSettingsView() {
        
        selectedFeedbackGenerator.impactOccurred()
        let settingsControllerReference = SettingsTableViewController(style: .grouped)         // FIXME: *** Settings conttrolle rnot displaying in grouped manner
        let navigationController = UINavigationController(rootViewController: settingsControllerReference)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - BUTTON SETUP
    internal func setStopButton() {
    
        // Check and hide the button
        guard isCurrentlyFasting != false else {
            return
        }
        
        stopButton = DynamicButton(type: .custom)
        stopButton.backgroundColor = UIColor.TipiePink()
        stopButton.setTitle("Stop Fasting", for: .normal)
        stopButton.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 19.0)
        stopButton.layer.cornerRadius = 8
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stopButton)
        
        // Constraints
        stopButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        stopButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        stopButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        stopButton.heightAnchor.constraint(equalToConstant: CGFloat(45)).isActive = true
    }
    
     var hello: [String] = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    
    // MARK : - UI INITIALIZAION
    private func setupDashboardProgressbarView() {
        
        view.addSubview(progressBarview)
        
//        setOverlayTitle()
        
        // Constraints
        progressBarview.heightAnchor.constraint(equalToConstant: self.view.bounds.height/2).isActive = true
        progressBarview.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        progressBarview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        progressBarview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
    
    }
    
//    var iterator = 1;
//
//    func setOverlayTitle() {
//
//        UIView.animate(withDuration: 0.7, delay: 1.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
//                self.progressBarview.progressBar.titleLabel.alpha = 0.0
//        },
//        completion: {(finished: Bool) -> Void in
//                print(self.iterator)
//                self.progressBarview.progressBar.titleLabel.text = self.hello[self.iterator]
//
//                // Fade in
//                UIView.animate(withDuration: 0.7, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations:
//                    {
//                        self.progressBarview.progressBar.titleLabel.alpha = 1.0
//                },
//                                           completion:
//                    {(finished: Bool) -> Void in
//                        self.iterator += 1
//
//                        if self.iterator < self.hello.count {
//                            self.setOverlayTitle();
//
//                        }
//
//                })
//        })
//    }
    
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
            
            // Delegate adherence
            masterSlider.delegate = self
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
//            masterSlider.closeButton.addTarget(self, action: #selector(self.closeChildView), for: .touchUpInside) // Slide down
            masterSlider.closeButton.addTarget(self, action: #selector(self.slideDownWithExpression), for: .touchUpInside) // Slide down
            masterSlider.beginButton.addTarget(self, action: #selector(self.beginFastingAction), for: .touchUpInside)

        }
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }) { _ in
            // Do some additional work after loading this view
        }
        
    }

    
    // MARK: SLIDE METHOD DOWN
    @objc func slideViewDown() {
        
        if let slider = slider {
            
            slider.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        
            // Animation with damping effect
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                slider.center = CGPoint(x: self.view.center.x, y: self.view.frame.height + self.slider!.frame.height/2)
                self.view.layoutIfNeeded()
                self.sliderBackgroundView.alpha =  0
            }) { _ in
                // Do some additional work after loading this view
                slider.removeFromSuperview()
                self.sliderBackgroundView.removeFromSuperview()
                self.slider = nil
            }
        }
    }
    
    
    // MARK: - ANIMATION WITH EXPRESSIONS
    @objc func slideDownWithExpression() {
        selectedFeedbackGenerator.impactOccurred()
        if let slider = slider {
            slider.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
            
            // Animation
            DispatchQueue.main.async {
                // Handle animation up and then down
                UIView.animate(withDuration: 0.2, animations: {
                    self.slider!.center.y -= 35
                }, completion: { (completed) in
                    if completed {
                        // Completion of the remainder of the slider slide down
                        UIView.animate(withDuration: 0.2, animations: {
                            
                            self.sliderBackgroundView.alpha = 0
                            self.slider?.alpha = 1
                            slider.center = CGPoint(x: self.view.center.x, y: self.view.frame.height + self.slider!.frame.height/2 )
                            slider.center = CGPoint(x: self.view.center.x, y: self.view.frame.height + self.slider!.frame.height/2)
                            self.view.layoutIfNeeded()
                            
                        }, completion: { (didComplete) in
                            if didComplete {
                                slider.removeFromSuperview()
                                self.sliderBackgroundView.removeFromSuperview()
                                self.slider = nil
                            }
                        })
                    }
                })
            }
        }
    }
    
    
    @objc func dataFromSliderControllerWith(test: Int) {
        print("Deleaged data is \(test)")
        slideViewDown() // there is an animation bug whislt this is loading down, use the other method, don't use this
    }
    

    
    // MARK: UI CONTROLS
    @objc func beginFastingAction() {
        
        print("Beginning ...")
        
        // Save the data

        
        // ... and finally, slide down
        slideDownWithExpression()
    }
    
    
    
    // Method callback is workign in this section
    @objc func updateUIprogressBar() {
        print("Invoking a test ...")
    }
    
    @objc func closeChildView() {
        selectedFeedbackGenerator.impactOccurred()
        slideViewDown()
    }
}



extension ViewController : UpdateProgressBarDelegate {
    // MARK: - PROGRESS BAR DELEGATE
    func updateWithValue() -> CGFloat {
        return 93.0
    }
}
