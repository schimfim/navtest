//
//  FPalette.swift
//  navtest
//
//  Created by Frank Reine on 15.11.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

class FPalette: FColorCubeBasedFilter {
    
    var strength: Float = 2.0
    var cents: [RGB] = []
    var presetNumber = 0
    
    // All filter instance fields must be vars with default values
    required init() {
        super.init()
        update()
    }
    
    // Per filter class convenience initializer, setting class vars (also inherited vars)
    convenience init(_ theName: String, cents:[RGB]) {
        self.init()
        self.name = theName
        //presetNumber = preset
        self.cents = cents
        update()
    }
    
    override func update() {
        
        for ib in 0..<NCUBE {
            for ig in 0..<NCUBE {
                for ir in 0..<NCUBE {
                    let idx = (ir + ig * NCUBE + ib * NCUBE*NCUBE)
                    var mu = [Float](count: cents.count, repeatedValue: 0.0)
                    var idist = [Float](count: cents.count, repeatedValue: 0.0)
                    let ci = cube![idx]
                    var sd : Float = 0.0
                    // calc inverse distances
                    for ic in 0..<cents.count {
                        let c = cents[ic]
                        idist[ic] = sqrt(3.0 / ( pow(ci.r-c.r,2) + pow(ci.g-c.g,2) + pow(ci.b-c.b,2) ))
                        sd = sd + powf(idist[ic], strength)
                    }
                    // calc membership
                    for i in 0..<cents.count {
                        mu[i] = powf(idist[i], strength) / sd
                    }
                    // reconstruct
                    let newc = RGB(0,0,0)
                    for i in 0..<cents.count {
                        newc.r += mu[i] * cents[i].r
                        newc.g += mu[i] * cents[i].g
                        newc.b += mu[i] * cents[i].b
                    }
                    cube![idx] = newc
                }
            }
        }
        super.update()
    }
    
    // MARK: NSCoding
    override func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeFloat(strength, forKey: "ColorCube.Palette.strength")
        aCoder.encodeInteger(presetNumber, forKey: "ColorCube.Palette.presetNumber")
        aCoder.encodeObject(cents, forKey: "ColorCube.Palette.cents")
        super.encodeWithCoder(aCoder)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
    	self.init()
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.NCUBE = aDecoder.decodeIntegerForKey("ColorCube.NCUBE")
        //self.presetNumber = aDecoder.decodeIntegerForKey("ColorCube.Palette.presetNumber")
        self.cents = aDecoder.decodeObjectForKey("ColorCube.Palette.cents") as! [RGB]
        self.strength = aDecoder.decodeFloatForKey("ColorCube.Palette.strength")
        update()
    }

}
