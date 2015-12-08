//
//  FPalette.swift
//  navtest
//
//  Created by Frank Reine on 15.11.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

let white_c   = RGB(1,1,1) // 0
let black_c   = RGB(0,0,0) // 1
let red_c     = RGB(1,0,0) // 2
let yellow_c  = RGB(1,1,0) // 3
let green_c   = RGB(0,1,0) // 4
let cyan_c    = RGB(0,1,1) // 5
let blue_c    = RGB(0,0,1) // 6
let magenta_c = RGB(1,0,1) // 7

let presets = [
    0: (cents:[white_c, black_c, red_c, yellow_c, green_c, cyan_c, blue_c, magenta_c], name:"Full"),
    1: (cents:[black_c, white_c, yellow_c, cyan_c], name:"yellow/cyan"),
    2: (cents:[black_c, red_c, green_c, blue_c], name:"RGB"),
    3: (cents:[white_c, black_c, blue_c], name:"wBb")
]


class FPalette: FColorCubeBasedFilter {
    
    var strength: Float = 2.0
    var cents = presets[0].cents
    var presetNumber = 0
    
    // All filter instance fields must be vars with default values
    required init() {
        super.init()
        update()
    }
    
    // Per filter class convenience initializer, setting class vars (also inherited vars)
    convenience init(preset: Int) {
        self.init()
        let p = presets[preset]
        self.name = p.name
        presetNumber = preset
        cents = presets[preset].cents
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
                    var newc = RGB(0,0,0)
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
        super.encodeWithCoder(aCoder)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
    	self.init()
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.NCUBE = aDecoder.decodeIntegerForKey("ColorCube.NCUBE")
        self.presetNumber = aDecoder.decodeIntegerForKey("ColorCube.Palette.presetNumber")
        self.cents = presets[presetNumber]
        self.strength = aDecoder.decodeFloatForKey("ColorCube.Palette.strength")
        update()
    }

}
