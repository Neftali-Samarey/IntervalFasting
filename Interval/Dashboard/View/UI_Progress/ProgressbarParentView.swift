//
//  ProgressbarParentView.swift
//  Interval
//
//  Created by Neftali Samarey on 5/23/19.
//  Copyright © 2019 Neftali Samarey. All rights reserved.
//

import UIKit


protocol UpdateProgressBarDelegate {
    func updateWithValue() -> CGFloat
}

public class ProgressbarParentView: UIView {

    // Progress bar object as property here
    public var progressBar = MKMagneticProgress()
    var delegate : UpdateProgressBarDelegate? = nil
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeDefaultStyling()
        // Calling the progress bar directly here help
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initializeDefaultStyling()
         //self.defaultGraphSetup()
    }
    
    public convenience init(/*image: UIImage, title: String*/) {
        self.init(frame: .zero)
//        self.image = image
//        self.title = title
    }
    
    func initializeDefaultStyling() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 6, height: 3)
        self.layer.masksToBounds = false;
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 0.5;
        
        addProgressBarToParentview()
        
       
     
    }
    
    private func addProgressBarToParentview() {
        
       // progressBar.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    
        //progressBar.setProgress(progress: 0.5, animated: true)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.progressShapeColor = UIColor.white.withAlphaComponent(0.8)
        progressBar.backgroundShapeColor = UIColor.white.withAlphaComponent(0.2)
        progressBar.titleColor = UIColor.white
        progressBar.percentColor = UIColor.white
        
        progressBar.lineWidth = 20
        progressBar.orientation = .bottom
        progressBar.lineCap = .round
        
        progressBar.title = "Title"
        progressBar.percentLabelFormat = "%.0f%%"
        
        addSubview(progressBar)
        
        progressBar.heightAnchor.constraint(equalToConstant: 250).isActive = true
        progressBar.widthAnchor.constraint(equalToConstant: 250).isActive = true
        progressBar.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 25).isActive = true
    }
    
    // MARK: - PUBLIC METHODS TO ACCESS THE PROGRESS BAR
    fileprivate func defaultGraphSetup() {
        progressBar.setProgress(progress: 0.0, animated: false)
    }
    
    public func updateWithCurrentValue(value: CGFloat) {
        
        progressBar.setProgress(progress: CGFloat(value), animated: false)
        
//        var testValue = delegate?.updateWithValue()
//        progressBar.setProgress(progress: testValue!, animated: true)
    }

}
