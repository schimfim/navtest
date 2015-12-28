//
//  FilterEditorViewController.swift
//  navtest
//
//  Created by Frank Reine on 29.10.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

protocol EditingEvents {
    func setupFilterEditor()
    func updateParameters()
}

class FilterEditorSupport<T: Filter> {

    var editFilter: T
    var evc: EditingEvents
    
    init(_ evc: EditingEvents) {
        // Fetch filter to edit from model
        editFilter = Filter.filters[Filter.rowToEdit] as! T
        self.evc = evc
    }
    
    func setupSupport() {
        // Call back to VC in charge
        evc.setupFilterEditor()
        parametersChanged()
    }
    
    func parametersChanged() {
    	// Call back to VC in charge
        evc.updateParameters()
        editFilter.parameterChanged()
        Filter.updateResultImageAsync()
    	// xxx editFilter.updateAndApplyAsync()
    }
    
	/*
    func startEditingName(sender: UITextField) {
        NSLog("Start editing name")
        performSegueWithIdentifier("showNameEditor", sender: self)
    }
    */

}
