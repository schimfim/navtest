//
//  FHueAdjustVC.swift
//  navtest
//
//  Created by Frank Reine on 14.11.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

class FHueAdjustVC: UIViewController, EditingEvents {
    var supp: FilterEditorSupport<FHueAdjust>!
    
    @IBOutlet var value: UISlider!
    
    override func viewDidLoad() {
        supp = FilterEditorSupport(self)
        super.viewDidLoad()
    }
    
    @IBAction func updateValue(sender: UISlider) {
        supp.parametersChanged()
    }
    
    // Gets called from FilterEditorViewController
    func setupFilterEditor() {
        value.value = supp.editFilter.value / (2 * 3.14)
    }

    // Gets called from FilterEditorViewController
    func updateParameters() {
        supp.editFilter.value = value.value * 2 * 3.14
    }

}
