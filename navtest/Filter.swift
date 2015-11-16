//
//  Filter.swift
//  navtest
//
//  Created by Frank Reine on 31.10.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

let singleType = FPalette.self
let singleSegueID = "FPalette"
//let singleSegueID = "FHueAdjust"

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
        return [singleType.init("HH-01"), singleType.init("SV-03"), singleType.init("VH-05")]
    }
    
    static func addFilter(type: String) {
    	var newFilter: Filter!
        switch type {
    		default: newFilter = singleType.init("#unnamed")
        }
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

    static func updateResultImage() {
        let out = Filter.processCurrentFilter()
        Filter.resultImage.image = out
    }
    
    static func segueIDforRowToEdit()->String {
        NSLog("Performing segue: %@", singleSegueID)
        return singleSegueID
    }
    
    // MARK: - Instance interface

    var name: String

    required init(_ theName: String) {
        name = theName
        super.init()
    }
    
    func process(inImage: CIImage) -> CIImage {
        NSLog("Missing override of process in filter name %@", name)
        return inImage
    }
    
}
