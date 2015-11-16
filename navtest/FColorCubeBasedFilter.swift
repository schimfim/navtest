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
}

class FColorCubeBasedFilter: Filter {
    
    private var NCUBE = 4
    private var cubeLength: Int?
    var cube: [RGB]?
    
    // data structure for CIFilter:cube3d
    var cubeData: NSData?
    
    let filter = CIFilter(name:"CIColorCube")!
    
    private func reset() {
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
    
    func setNCUBE(n:Int) {
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
