//
//  .swift
//  navtest
//
//  Created by Frank Reine on 15.11.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

class FPaletteVC: EditorVC, EditingEvents {
    var supp: FilterEditorSupport<FPalette>!
    
    @IBOutlet var strength: UISlider!
    @IBOutlet var radius: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        supp = FilterEditorSupport<FPalette>(self)
    }
    
    // All IBActions call parametersChanged
    @IBAction func updateParameters(sender: UISlider) {
        supp.parametersChanged()
    }
    
    // Gets called from FilterEditorViewController
    func setupFilterEditor() {
        //strength.value = sqrtf((supp.editFilter.strength - 1.0) / 5.0)
        //radius.value = sqrtf((supp.editFilter.origDist - 0.0) / 1.0)
        strength.value = (supp.editFilter.strength - 1.0) / 5.0
        radius.value = (supp.editFilter.origDist - 0.0) / 1.0
    }
    
    // Gets called from FilterEditorViewController
    func updateParameters() {
        //supp.editFilter.strength = powf(strength.value, 2.0) * 5.0 + 1.0
        //supp.editFilter.origDist = powf(radius.value, 2.0) * 1.0 + 0.0
        supp.editFilter.strength = strength.value * 5.0 + 1.0
        supp.editFilter.origDist = radius.value * 1.0 + 0.0
    }
}
