//
//  Filter.swift
//  navtest
//
//  Created by Frank Reine on 31.10.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

class Filter: NSObject {
    
    //
    // Class variables
    static var filters: [Filter] = Filter.setup()
    static var rowToEdit = 0
    
    //
    // Class methods
    private static func setup() -> [Filter] {
        NSLog("Filter setup")
        return [Filter("HH-01"), Filter("SV-03"), Filter("VH-05")]
    }
    
    static func addFilter() {
        filters.append(Filter("#unnamed"))
    }
    
    // Instance variables
    var name: String
    var value: Float
    
    // Instance methods
    init(_ theName: String) {
        name = theName
        value = 0.0
    }
}
