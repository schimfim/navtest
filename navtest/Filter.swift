//
//  Filter.swift
//  navtest
//
//  Created by Frank Reine on 31.10.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

let singleSegueID = "FPalette"

struct PropertyKey {
    static let nameKey = "name"
}

class Filter: NSObject, NSCoding {
    
    // MARK: - Class interface

    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("navtest")
    
    // MARK: Properties
    
    static var filters: [Filter] = Filter.setup()
    static var rowToEdit = 0
    
    static var resultImageView: UIImageView!
    static var origImage: UIImage!
    static var activity: UIActivityIndicatorView!
    
    static private var currentFilter: Filter?
    static private var context: CIContext?
    static private var inImage: CIImage?
    
    private static func setup() -> [Filter] {
        NSLog("Filter setup")
        context = CIContext(options:nil)
        return [FPalette.init("P01", preset: 0), FPalette.init("P02", preset: 1), FPalette.init("P03", preset: 2), FPalette.init("P04", preset: 3)]
    }
    
    static func addFilter(type: String) {
    	var newFilter: Filter!
        switch type {
    		default: newFilter = FPalette.init("#unnamed")
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
    
    static func updateResultImageAsync() {
    	NSLog("1 Entering update method")
    	activity.startAnimating()
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0)) {
            NSLog("2 Starting async task")
            //let outputImage = currentFilter!.process(inImage!)
            sleep(5)
            dispatch_async(dispatch_get_main_queue()) {
            	NSLog("3 Dispatch to main queue")
                //let cgimg = context!.createCGImage(outputImage, fromRect: outputImage.extent)
                //let out = UIImage(CGImage: cgimg, scale: 1.0, orientation:.Up)
                activity.stopAnimating()
                //Filter.resultImageView.image = out
                //currentFilter?.saveFilters()
            }
            NSLog("4 Back in outer dispatch")
        }
        NSLog("5 Back in outer method")
    }

    static func updateResultImage() {
        let out = Filter.processCurrentFilter()
        Filter.resultImageView.image = out
        currentFilter?.saveFilters()
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
    
    // MARK: NSCoding
    
    func saveFilters() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(Filter.filters, toFile: Filter.ArchiveURL.path!)
        if !isSuccessfulSave {
            NSLog("Failed to save filters")
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        
        // Must call designated initializer.
        self.init(name)
    }
    
}
