//
//  HUDView.swift
//  navtest
//
//  Created by Frank Reine on 28.11.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

class HUDView: UIView {

    @IBOutlet var activity: UIActivityIndicatorView!
    @IBOutlet var message: UILabel!
    
    func setup() {
        self.hidden = true
        superview!.addConstraint(NSLayoutConstraint(item: superview!, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
        superview!.addConstraint(NSLayoutConstraint(item: superview!, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
    }
    
    func startProgress() {
        self.hidden = false
        activity.startAnimating()
        message.text = "Filtering..."
    }
    
    func stopProgress() {
        activity.stopAnimating()
        message.text = "Filtering done!"
        self.hidden = true
    }
    
    func requiresConstraintBasedLayout() -> Bool {
        return true
    }
}
