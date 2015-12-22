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

class FilterEditorViewController: UIViewController {

    var editFilter: Filter!
    @IBOutlet var filterName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Fetch filter to edit from model
        // TODO Clean up
        editFilter = Filter.filters[Filter.rowToEdit]
        filterName.text = editFilter.name
        
        // Call back to VC in charge
        evc.setupFilterEditor()
        parametersChanged()
    }
    
    func setEditorVC(evc: EditingEvents) {
    	self.evc = evc
    }
    
    func parametersChanged() {
    	// Call back to VC in charge
    	evc.updateParameters()
    	// xxx editFilter.updateAndApplyAsync()
    }
    
	/*
    func startEditingName(sender: UITextField) {
        NSLog("Start editing name")
        performSegueWithIdentifier("showNameEditor", sender: self)
    }
    */

}
