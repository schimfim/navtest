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
    
    var cancelled: Bool = false
    
    func setup() {
        self.hidden = true
        cancelled = false
        superview!.addConstraint(NSLayoutConstraint(item: superview!, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
        superview!.addConstraint(NSLayoutConstraint(item: superview!, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
    }
    
    func start() {
        let duration = 0.1
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64(duration * Double(NSEC_PER_SEC)))
        dispatch_after(popTime, dispatch_get_main_queue()) {
            if self.cancelled {
                self.cancelled = false
                return
            }
            else {
                // main queue???
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0)) {
                    self.startProgress()
                }
            }
        }
    }
    
    func startProgress() {
        self.hidden = false
        activity.startAnimating()
        message.text = "Filtering..."
    }
    
    func stopProgress() {
        activity.stopAnimating()
        showPrompt("Filtering done!", duration: 2.0)
    }
    
    func showPrompt(text: String, duration: Double) {
        self.message.text = text
        self.hidden = false
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64(duration * Double(NSEC_PER_SEC)))
        dispatch_after(popTime, dispatch_get_main_queue()) {
            self.hidden = true
        }
    }
    
    func cancel() {
        cancelled = true
    }
    
    // UIView
    func requiresConstraintBasedLayout() -> Bool {
        return true
    }
}
