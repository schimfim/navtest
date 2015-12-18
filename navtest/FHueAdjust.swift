//
//  FHueAdjust.swift
//  navtest
//
//  Created by Frank Reine on 14.11.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

class FHueAdjust: Filter {

    var value: Float
    let filter = CIFilter(name: "CIHueAdjust")!
    
    required override init() {
        value = 0.0
        super.init()
    }
    
    override func process(inImage: CIImage) -> CIImage {
        filter.setValue(inImage, forKey: kCIInputImageKey)
        filter.setValue(value, forKey: "inputAngle")
        let outputImage = filter.outputImage
        return outputImage!
    }

}
