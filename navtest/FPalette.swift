//
//  FPalette.swift
//  navtest
//
//  Created by Frank Reine on 15.11.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

class FPalette: FColorCubeBasedFilter {
    
    required init(_ theName: String) {
        super.init(theName)
        update()
    }
    
    func update() {
        for i in 0..<cube!.count {
            cube![i].r = 0.0
        }
        NSLog("Updated cube")
    }

}
