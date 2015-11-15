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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filter = self.editFilter as? FPalette
        filter?.update()
        Filter.updateResultImage()
    }
    
}
