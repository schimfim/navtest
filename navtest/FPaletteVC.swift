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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let filter =  self.editFilter as FPalette
        strength.value = ((filter.strength)! - 0.5) / 3.5
        filter.parameterChanged()
        Filter.updateResultImageAsync()
    }
    
    @IBAction func updateStrength(sender: UISlider) {
        let filter =  self.editFilter as FPalette
        filter.strength = strength.value * 3.5 + 0.5
        Filter.updateResultImageAsync()
    }
    
    override func startFilterEditor() {
    	
    }
    
    override func parametersChanged() {
    	
    }
}
