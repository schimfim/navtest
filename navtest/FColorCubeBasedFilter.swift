//
//  FColorCubeBasedFilter.swift
//  navtest
//  Base class for all filters using one CIColorCube
//
//  Created by Frank Reine on 15.11.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

struct RGB {
    var r:Float = 0.0
    var g:Float = 0.0
    var b:Float = 0.0
    var a:Float = 1.0
    
    init(_ nr:Float, _ ng:Float, _ nb:Float) {
        r = nr
        g = ng
        b = nb
    }
    
    init(h:Float, s:Float, v:Float) {
        // convert to rgb
        let color = UIColor(hue: CGFloat(h), saturation: CGFloat(s), brightness: CGFloat(v), alpha: CGFloat(1.0))
        var nr : CGFloat = 0.0
        var ng : CGFloat = 0.0
        var nb : CGFloat = 0.0
        var na : CGFloat = 0.0
        color.getRed(&nr, green:&ng, blue:&nb, alpha:&na)
        
        r = Float(nr)
        g = Float(ng)
        b = Float(nb)
    }
}

class FColorCubeBasedFilter: Filter {
    
    var NCUBE = 4
    var cubeLength: Int?
    var cube: [RGB]?
    
    // data structure for CIFilter:cube3d
    var cubeData: NSData?
    
    let filter = CIFilter(name:"CIColorCube")!
    
    func reset() {
        cubeLength = NCUBE * NCUBE * NCUBE
        cube = [RGB](count:cubeLength!, repeatedValue:RGB(0,0,0))
        let div = Float(NCUBE-1)
        for ib in 0..<NCUBE {
            for ig in 0..<NCUBE {
                for ir in 0..<NCUBE {
                    let idx = (ir + ig * NCUBE + ib * NCUBE*NCUBE)
                    cube![idx] = RGB(Float(ir)/div, Float(ig)/div, Float(ib)/div)
                }
            }
        }
        //cubeData = NSData(bytes: cube!, length: cubeLength! * sizeof(RGB))
        update()
    }
    
    func update() {
        cubeData = NSData(bytes: cube!, length: cubeLength! * sizeof(RGB))
    }
    
    func putNCUBE(n:Int) {
        NCUBE = n
        reset()
    }
    
    required init(_ theName: String) {
        super.init(theName)
        reset()
    }
    
    override func process(inImage: CIImage) -> CIImage {
        filter.setValue(inImage, forKey: kCIInputImageKey)
        filter.setValue(NCUBE, forKey: "inputCubeDimension")
        filter.setValue(cubeData, forKey: "inputCubeData")
        let outputImage = filter.outputImage
        return outputImage!
    }

}
