//
//  FilterTableViewController.swift
//  navtest
//
//  Created by Frank Reine on 25.10.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

class FilterTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        Filter.setInImage(Filter.origImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UI actions
    
    @IBOutlet var addButton: UIBarButtonItem!
    @IBAction func addAction(sender: AnyObject) {
        NSLog("addAction")
        Filter.addFilter("type")
        self.tableView.reloadData()
        Filter.rowToEdit = Filter.filters.count - 1
        Filter.setCurrentFilter(Filter.rowToEdit)
        performSegueWithIdentifier(Filter.segueIDforRowToEdit(), sender: self)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Filter.filters.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FilterCell")!
        cell.textLabel?.text = Filter.filters[indexPath.row].name
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            Filter.filters.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let movedObject = Filter.filters[fromIndexPath.row]
        Filter.filters.removeAtIndex(fromIndexPath.row)
        Filter.filters.insert(movedObject, atIndex: toIndexPath.row)
        // NSLog("%@", "\(fromIndexPath.row) => \(toIndexPath.row) \(filters)")
        // To check for correctness enable: self.tableView.reloadData()
    }

     /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        NSLog("Edit row %d", indexPath.row)
        Filter.rowToEdit = indexPath.row
        Filter.setCurrentFilter(indexPath.row)
        performSegueWithIdentifier(Filter.segueIDforRowToEdit(), sender: self)

    }
    
    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        Filter.setCurrentFilter(indexPath.row)
        Filter.updateResultImage()
        //let out = Filter.processCurrentFilter()
        //Filter.resultImage.image = out
    }
    
    // MARK: - Navigation

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        let vc: FilterEditorViewController = segue.destinationViewController as! FilterEditorViewController
        // Pass the selected object to the new view controller.
        if let i = self.tableView.indexPathForSelectedRow?.row {
            vc.filterName = filters[i].name
        }
        else {
            vc.filterName = "Nothing selected"
        }
    }
    */

}
