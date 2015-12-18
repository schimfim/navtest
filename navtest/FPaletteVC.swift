//
//  FPaletteVC.swift
//  navtest
//
//  Created by Frank Reine on 15.11.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

class FPaletteVC: FilterEditorViewController {

    // associated filter
    // TODO: put in superclass
    var filter: FPalette!
    
    @IBOutlet var strength: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filter = self.editFilter as? FPalette
        strength.value = ((filter?.strength)! - 0.5) / 3.5
        filter.parameterChanged()
        Filter.updateResultImageAsync()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func updateStrength(sender: UISlider) {
        filter.strength = strength.value * 3.5 + 0.5
        Filter.updateResultImageAsync()
    }
}
