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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Fetch filter to edit from model
        editFilter = Filter.filters[Filter.rowToEdit]
    }

    @IBAction func startEditingName(sender: UITextField) {
        NSLog("Start editing name")
        performSegueWithIdentifier("showNameEditor", sender: self)
    }

}
