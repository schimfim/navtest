//
//  ContainerVC.swift
//  navtest
//
//  Created by Frank Reine on 13.11.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Show filter editor pane
        //performSegueWithIdentifier("showRed", sender: self)
        let vc = storyboard?.instantiateViewControllerWithIdentifier("EVCRed")
        //showViewController(vc!, sender: self)
        addChildViewController(vc!)
    }

    override func viewWillAppear(animated: Bool) {
        let vc = storyboard?.instantiateViewControllerWithIdentifier("EVCRed")
        addChildViewController(vc!)
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
