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
        // TODO strange...
        editFilter = Filter.filters[Filter.rowToEdit]
        filterName.text = editFilter.name
    }

	/*
    func startEditingName(sender: UITextField) {
        NSLog("Start editing name")
        performSegueWithIdentifier("showNameEditor", sender: self)
    }
    */

}
