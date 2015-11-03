//
//  NameEditorVC.swift
//  navtest
//
//  Created by Frank Reine on 01.11.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

class NameEditorVC: UIViewController {

    var editFilter: Filter!
    
    @IBOutlet var nameField: UITextField!
    @IBAction func endEdit(sender: UITextField) {
        NSLog("End edit: %@", sender.text!)
        editFilter.name = sender.text!
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        editFilter = Filter.filters[Filter.rowToEdit]
        nameField.text = editFilter.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
