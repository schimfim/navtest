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
    }
    
    override func viewWillAppear(animated: Bool) {
        filter = self.editFilter as? FPalette
        strength.value = ((filter?.strength)! - 1.0) / 2.0
        filter!.reset()
        filter?.update()
        Filter.updateResultImageAsync()
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func updateStrength(sender: UISlider) {
        filter?.strength = strength.value * 2.0 + 1.0
        filter!.reset()
        filter?.update()
        Filter.updateResultImageAsync()
        Filter.saveFilters()
    }
}
