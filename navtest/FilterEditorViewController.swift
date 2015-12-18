//
//  FilterEditorViewController.swift
//  navtest
//
//  Created by Frank Reine on 29.10.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

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
        setupFilterEditor(editFilter)
        parametersChanged()
    }
    
    func parametersChanged() {
    	// Call back to VC in charge
    	updateParameters(editFilter)
    	// xxx editFilter.updateAndApplyAsync()
    }
    
    func setupFilterEditor<FilterType: Filter>(filter: FilterType) {
        NSLog("Missing override of setupFilterEditor")
    }

    func updateParameters<FilterType: Filter>(filter: FilterType) {
        NSLog("Missing override of updateParameters")
    }

	/*
    func startEditingName(sender: UITextField) {
        NSLog("Start editing name")
        performSegueWithIdentifier("showNameEditor", sender: self)
    }
    */

}
