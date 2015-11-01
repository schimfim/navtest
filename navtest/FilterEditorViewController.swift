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
    
    @IBOutlet var editName: UITextField!
    @IBOutlet var value: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        editFilter = Filter.filters[Filter.rowToEdit]
        editName.text = editFilter.name
        value.value = editFilter.value
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func updateValue(sender: UISlider) {
        editFilter.value = sender.value
    }
    
    @IBAction func startEditingName(sender: UITextField) {
        NSLog("Start editing name")
        performSegueWithIdentifier("showNameEditor", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
