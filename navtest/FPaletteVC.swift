//
//  .swift
//  navtest
//
//  Created by Frank Reine on 15.11.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

class FPaletteVC: FilterEditorViewController, EditingEvents {
    
    @IBOutlet var strength: UISlider!
    var filter: FPalette!
    
    override func viewDidLoad() {
    	setEditorVC(self) ???
    	super.viewDidLoad()
        filter = editFilter as! FPalette
    }
    
    // All IBActions call parametersChanged
    @IBAction func updateStrength(sender: UISlider) {
        parametersChanged()
    }
    
    // Gets called from FilterEditorViewController
    func setupFilterEditor() {
        strength.value = (filter.strength - 0.5) / 3.5
    }
    
    // Gets called from FilterEditorViewController
    func updateParameters() {
        filter.strength = strength.value * 3.5 + 0.5
    }
}
