//
//  SliderView.swift
//  Interval
//
//  Created by Neftali Samarey on 5/28/19.
//  Copyright © 2019 Neftali Samarey. All rights reserved.
//

import Foundation
import UIKit

enum EntryType {
    case New
    case Edit
}

/*
 This protocol will handle the transering of data to the main controller
 */


protocol getSliderSelectionDataDelegate {
    func dataFromSliderControllerWith(test: Int)
    func userDidSaveDataWith(sampleSelectionId: Int)
}

class SliderView : UIView {

    // Delegate
    var delegate : getSliderSelectionDataDelegate? = nil

    // Meter Instance
    var timeMeter = AMSpeedMeterView()
    var selectedFastingTimeSlot = 0
  
    let selectedFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    // MARK: UI PROPERTIES


    let bottomTimeframeButtons = TimeframeStackview()
    
    let mainBackground : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let viewTitle : UILabel = {
        let label = UILabel()
        label.text = "New Goal"
        label.textColor = UIColor.init(hexString: "#383838")
        label.layer.backgroundColor = UIColor.clear.cgColor
        label.font = UIFont(name: "Roboto-Medium", size: 22.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dynamicButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 23.0)
        button.backgroundColor = UIColor.turquoiseColor()
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // TODO: - DECLARED BUTTON FOR USE
    var beginButton : DynamicButton
    
    let closeButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "close"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    
    public required init?(coder aDecoder: NSCoder) {
        
        // INIT THE BUTTON (WORK ON FIXING A FsEW BUGS)
        beginButton = DynamicButton(defaultColor: .UIPinkOrange(), highlightedColor: .UIPinkOrangeDarkerShade())
        beginButton.backgroundColor = UIColor.UIPinkOrange()
        beginButton.setTitle("Start Now", for: .normal)
        beginButton.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 21.0)
        beginButton.roundEdges()
        beginButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Initiatew the dynamic clock
    
       
        super.init(coder: aDecoder)
        
        selectedFeedbackGenerator.prepare()
        setTopLayout()
        setButtonLayout()
        setupMeter()
        setupBackgroundView()
        
        // Initlaize the controls
        bottomTimeframeButtons.eightHours.addTarget(self, action: #selector(SliderView.setEightHours), for: .touchUpInside)
        bottomTimeframeButtons.thirteenHours.addTarget(self, action: #selector(SliderView.setThirteenHours), for: .touchUpInside)
        bottomTimeframeButtons.sixteenHours.addTarget(self, action: #selector(SliderView.setSixteenHours), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
    
        // TODO: Works but not as efficient
        beginButton = DynamicButton(defaultColor: .emeraldColor(), highlightedColor: .lightGray)
        beginButton.backgroundColor = UIColor.emeraldColor()
        beginButton.setTitle("Start Now", for: .normal)
        beginButton.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 21.0)
        beginButton.roundEdges()
        beginButton.translatesAutoresizingMaskIntoConstraints = false
       
        super.init(frame: frame)
        self.layer.cornerRadius = 15
        self.backgroundColor = UIColor.init(red: 245/255, green: 246/255, blue: 250/255, alpha: 1.0)

        selectedFeedbackGenerator.prepare()
        setTopLayout()
        setButtonLayout()
        setupTimeGauge()
       // setupMeter()
        setupBackgroundView()
        
        bottomTimeframeButtons.eightHours.addTarget(self, action: #selector(SliderView.setEightHours), for: .touchUpInside)
        bottomTimeframeButtons.thirteenHours.addTarget(self, action: #selector(SliderView.setThirteenHours), for: .touchUpInside)
        bottomTimeframeButtons.sixteenHours.addTarget(self, action: #selector(SliderView.setSixteenHours), for: .touchUpInside)
    }
    
    deinit {
    
        
    }
    
    
    private func setupBackgroundView() {
        self.addSubview(mainBackground)
        self.sendSubviewToBack(mainBackground)
        // background size will be adjusted to by the caller
       // mainBackground.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    private func setButtonLayout() {
        
        bottomTimeframeButtons.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(beginButton)
        self.addSubview(bottomTimeframeButtons)
        //  dynamicButton.addTarget(self, action: #selector(SliderView.comfirmAllDatapoints), for: .touchUpInside)
        
        // Bottom timeframe buttons
        bottomTimeframeButtons.bottomAnchor.constraint(equalTo: self.beginButton.topAnchor, constant: -50).isActive = true
        bottomTimeframeButtons.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        bottomTimeframeButtons.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        bottomTimeframeButtons.heightAnchor.constraint(equalToConstant: self.bounds.height/5).isActive = true
        
        DispatchQueue.main.async {
            self.beginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
            self.beginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            self.beginButton.widthAnchor.constraint(equalToConstant: self.bounds.width - 30).isActive = true
            self.beginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50).isActive = true
        }
    }
    
    private func setTopLayout() {
    
        
        self.addSubview(closeButton)
        self.addSubview(viewTitle)
      
    
        
        // Close button
        self.closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        self.closeButton.widthAnchor.constraint(equalToConstant: 52).isActive = true
        self.closeButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        self.closeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        

        // Label title
        self.viewTitle.textAlignment = .center
        
        self.viewTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        self.viewTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 25).isActive = true
        self.viewTitle.widthAnchor.constraint(equalToConstant: self.bounds.width - 20).isActive = true
        self.viewTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
      
    }
    
    private func setupTimeGauge() {
        
    }
    
    
    private func setupMeter() {

        timeMeter.translatesAutoresizingMaskIntoConstraints = false
        addSubview(timeMeter)
        
        // Some styling directly to the meter
//        timeMeter.meterColor = UIColor.blue
        
        timeMeter.minValue = 0
        timeMeter.maxValue = 16
        timeMeter.meterColor = UIColor.white
        timeMeter.numberOfValue = 3
        timeMeter.valueIndexColor = UIColor.lightGray
        
        
        timeMeter.valueHandColor = UIColor.TipiePink()
        timeMeter.valueHandWidth = 10
        
        timeMeter.meterBorderLineColor = UIColor.white
        timeMeter.incrementBorderWith(width: 10)
        
        let local_width = self.bounds.width/2
        let local_height = self.bounds.height/2
        
        // Enable the constraints
       // timeMeter.frame = CGRect(x: 40 , y: 40, width: 250, height: 150)
        timeMeter.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 30).isActive = true
        timeMeter.widthAnchor.constraint(equalToConstant: local_width + 100).isActive = true
        timeMeter.heightAnchor.constraint(equalToConstant: local_height + 100).isActive = true
        timeMeter.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        
    }

   
    
    
    // TODO: AT THE TIMER CLOCK TO THE SUBVIEW
    // self.addSubview(timeMeter)
    
  

    // TODO: - INTENDED COLOR INIT IS NOT WORKING, FIX THIS IN CLASS LEVEL DEFITIION
    func initializeDynamicCustomButton() {
      //  beginButton = DynamicButton(defaultColor: .blue, highlightedColor: .lightGray) // Sample
    }
    
    // MARK: Gets the index (1, 2, 3) from the timeframe view itself. Getter only
    func getTimeframeSelectedIndex() -> Int {
        return bottomTimeframeButtons.currentSelectedButton
    }
    
    
    // MARK: Method for the button to then pass this data backt to the main controller
    @objc func comfirmAllDatapoints() {
        delegate?.dataFromSliderControllerWith(test: getTimeframeSelectedIndex())
    }
    
    
    
    // MARK: SELECTION MADE FROM USER
    
    @objc func setEightHours() {

        selectedFeedbackGenerator.impactOccurred()
        timeMeter.currentValue = 8
        selectedFastingTimeSlot = timeMeter.getSelectedValue()
//        print("Seleced button is 8 hours")
//        currentSelectedButton = 1
//        updateSelectionMade(selection: currentSelectedButton)

    }
    
    @objc func setThirteenHours() {

        selectedFeedbackGenerator.impactOccurred()
        timeMeter.currentValue = 13
        selectedFastingTimeSlot = timeMeter.getSelectedValue()
    }
    
    @objc func setSixteenHours() {

        selectedFeedbackGenerator.impactOccurred()
        timeMeter.currentValue = 16
        selectedFastingTimeSlot = timeMeter.getSelectedValue()
        
    }
    
    
    internal func commitChangesMadeWith(timeSelected: Int) {
        print("Saved with changes made with: \(timeSelected)")
    }
    
    
    
}
