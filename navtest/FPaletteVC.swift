//
//  .swift
//  navtest
//
//  Created by Frank Reine on 15.11.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

class FPaletteVC: FilterEditorViewController {
    
    @IBOutlet var strength: UISlider!
    
    // All IBActions call parametersChanged
    @IBAction func updateStrength(sender: UISlider) {
        parametersChanged()
    }
    
    // Gets called from FilterEditorViewController
    override func setupFilterEditor() {
        let filter =  self.editFilter as FPalette
        strength.value = ((filter.strength)! - 0.5) / 3.5
        filter.parameterChanged()
        Filter.updateResultImageAsync()    	
    }
    
    // gets called from FilterEditorViewController
    override func updateParameters() {
        let filter =  self.editFilter as FPalette
        filter.strength = strength.value * 3.5 + 0.5
        Filter.updateResultImageAsync()
    }
}
