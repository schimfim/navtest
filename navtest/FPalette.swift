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
    var origDist: Float = 0.5 // default distance to original color
    var cents: [RGB]
    
    init(_ theName: String, cents:[RGB]) {
        self.cents = cents
        super.init()
        self.name = theName
    }
    
    override func updateCube() {
    	let div = Float(NCUBE-1)
        for ib in 0..<NCUBE {
            for ig in 0..<NCUBE {
                for ir in 0..<NCUBE {
                    let idx = (ir + ig * NCUBE + ib * NCUBE*NCUBE)
                    var mu = [Float](count: cents.count, repeatedValue: 0.0)
                    var idist = [Float](count: cents.count, repeatedValue: 0.0)
                    let ci = RGB(Float(ir)/div, Float(ig)/div, Float(ib)/div)
                    var sd : Float = powf(1 / origDist, strength) // sum of inverse distances, including default distance to original color
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
                    // membership for original color
                    let muOrig = powf(1 / origDist , strength) / sd
                    // reconstruct
                    var newc = RGB(0,0,0)
                    for i in 0..<cents.count {
                        newc.r += mu[i] * cents[i].r
                        newc.g += mu[i] * cents[i].g
                        newc.b += mu[i] * cents[i].b
                    }
                    // mix in original color
                    newc.r += muOrig * ci.r
                    newc.g += muOrig * ci.g
                    newc.b += muOrig * ci.b

                    cube[idx] = newc
                }
            }
        }
    }
    
    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeFloat(strength, forKey: "ColorCube.Palette.strength")
        var store = [RGBstore](count: cents.count, repeatedValue: RGBstore(RGB(0,0,0)))
        for i in 0..<cents.count {
            store[i] = RGBstore(cents[i])
        }
        aCoder.encodeObject(store, forKey: "ColorCube.Palette.cents")
        aCoder.encodeObject(name, forKey: "name")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey("name") as! String
        var store: [RGBstore]
        store = aDecoder.decodeObjectForKey("ColorCube.Palette.cents") as! [RGBstore]
        var cents = [RGB](count: store.count, repeatedValue: RGB(0,0,0))
        for i in 0..<store.count {
            cents[i] = store[i].rgb
        }
        self.init(name, cents:cents)
        self.strength = aDecoder.decodeFloatForKey("ColorCube.Palette.strength")
        updateCube()
    }
}
