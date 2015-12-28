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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        supp = FilterEditorSupport<FPalette>(self)
    }
    
    // All IBActions call parametersChanged
    @IBAction func updateStrength(sender: UISlider) {
        supp.parametersChanged()
    }
    
    // Gets called from FilterEditorViewController
    func setupFilterEditor() {
        strength.value = (supp.editFilter.strength - 0.5) / 3.5
    }
    
    // Gets called from FilterEditorViewController
    func updateParameters() {
        supp.editFilter.strength = strength.value * 3.5 + 0.5
    }
}
