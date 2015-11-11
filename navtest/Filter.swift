//
//  Filter.swift
//  navtest
//
//  Created by Frank Reine on 31.10.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

class Filter: NSObject {
    
    // MARK: - Class interface
    
    static var filters: [Filter] = Filter.setup()
    static var rowToEdit = 0
    
    static var resultImage: UIImageView!
    static var origImage: UIImage!
    
    static private var currentFilter: Filter?
    static private var context: CIContext?
    static private var inImage: CIImage?
    
    private static func setup() -> [Filter] {
        NSLog("Filter setup")
        context = CIContext(options:nil)
        return [Filter("HH-01"), Filter("SV-03"), Filter("VH-05")]
    }
    
    static func addFilter(type: String) {
    	var newFilter: Filter!
    	switch(type):
    		case "Aged": newFilter = Filter("#unnamed")
    		case "cxf" : newFilter = FColorXfer("#unnamed")
    	
        filters.append(newFilter)
    }
    
    static func setInImage(newImage : UIImage) {
        inImage = CIImage(CGImage: newImage.CGImage!)
    }
    
    static func setCurrentFilter(i: Int) {
        currentFilter = filters[i]
    }
    
    static func processCurrentFilter() -> UIImage {
        let outputImage = currentFilter!.process(inImage!)
        let cgimg = context!.createCGImage(outputImage, fromRect: outputImage.extent)
        let newImage = UIImage(CGImage: cgimg, scale: 1.0, orientation:.Up)
        
        return newImage
    }

    // MARK: - Instance interface

    var name: String
    var value: Float
    var filter: CIFilter!

    init(_ theName: String) {
        name = theName
        value = 0.0
        filter = CIFilter(name: "CIHueAdjust")
        super.init()
    }
    
    func process(inImage: CIImage) -> CIImage {
        filter.setValue(inImage, forKey: kCIInputImageKey)
        filter.setValue(value, forKey: "inputAngle")
        
        let outputImage = filter.outputImage
        return outputImage!
    }
    
    
}
