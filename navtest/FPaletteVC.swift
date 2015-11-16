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
    var filter: FPalette?
    
    @IBOutlet var strength: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filter = self.editFilter as? FPalette
        strength.value = ((filter?.strength)! - 0.5) / 4.5
        filter?.update()
        Filter.updateResultImage()
    }
    
    @IBAction func updateStrength(sender: UISlider) {
        filter?.strength = strength.value * 4.5 + 0.5
        filter!.reset()
        filter?.update()
        Filter.updateResultImage()
    }
}
