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

class RGBstore: NSObject, NSCoding {
    let rgb: RGB
    
    init(_ color: RGB) {
        rgb = color
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeFloat(rgb.r, forKey: "RGB.r")
        aCoder.encodeFloat(rgb.g, forKey: "RGB.g")
        aCoder.encodeFloat(rgb.b, forKey: "RGB.b")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        var newCol = RGB(0,0,0)
        newCol.r = aDecoder.decodeFloatForKey("RGB.r")
        newCol.g = aDecoder.decodeFloatForKey("RGB.g")
        newCol.b = aDecoder.decodeFloatForKey("RGB.b")
        self.init(newCol)
    }
}

class FColorCubeBasedFilter: Filter {
    
    var NCUBE: Int = 4
    var cubeLength: Int = 0
    var cube: [RGB]?
    
    // data structure for CIFilter:cube3d
    var cubeData: NSData?
    
    var filter = CIFilter(name:"CIColorCube")!
    
    init() {
    	super.init()
    	setupEmptyCube()
    }
    
    func setupEmptyCube() {
        cubeLength = NCUBE * NCUBE * NCUBE
        cube = [RGB](count:cubeLength!, repeatedValue:RGB(0,0,0))
        updateCubeData()
    }
    
    func updateCubeData() {
    	// TODO check nocopy option
        cubeData = NSData(bytes: cube!, length: cubeLength! * sizeof(RGB))
    }
    
    override func process(inImage: CIImage) -> CIImage {
        filter.setValue(inImage, forKey: kCIInputImageKey)
        filter.setValue(NCUBE, forKey: "inputCubeDimension")
        filter.setValue(cubeData, forKey: "inputCubeData")
        let outputImage = filter.outputImage
        return outputImage!
    }
}