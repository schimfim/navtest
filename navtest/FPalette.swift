//
//  FPalette.swift
//  navtest
//
//  Created by Frank Reine on 15.11.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

class FPalette: FColorCubeBasedFilter {
    
    var strength: Float = 0.0
    
    required init(_ theName: String) {
        super.init(theName)
        update()
    }
    
    override func update() {
        for i in 0..<cube!.count {
            cube![i].r = strength
        }
        NSLog("Updated cube")
        super.update()
    }

}
