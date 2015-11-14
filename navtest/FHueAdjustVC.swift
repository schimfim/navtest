//
//  FHueAdjustVC.swift
//  navtest
//
//  Created by Frank Reine on 14.11.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

class FHueAdjustVC: FilterEditorViewController {
    
    // associated filter
    var filter: FHueAdjust?
    
    @IBOutlet var value: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filter = self.editFilter as? FHueAdjust

        value.value = filter!.value / (2 * 3.14)
    }
    
    @IBAction func updateValue(sender: UISlider) {
        filter!.value = sender.value * 2 * 3.14
        Filter.updateResultImage() // is this clean??
    }

}
