//
//  FirstViewController.swift
//  MANyear
//
//  Created by Jordan Melberg on 1/31/15.
//  Copyright (c) 2015 Jordan Melberg. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tblTasks: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    // Return to view
    override func viewWillAppear(animated: Bool) {
        tblTasks.reloadData()
    }
    // UITableViewDelete
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!){
        
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            // Find task to delete
            let deleteTask = taskMgr.tasks[indexPath.row]
            
            //Verify Deletion
            let alertController = UIAlertController(
                title: "Delete" + taskMgr.tasks[indexPath.row].name + "?",
                message: "Are you sure you want to remove this MANEvent?",
                preferredStyle: UIAlertControllerStyle.Alert
            )
            
            let cancelAction = UIAlertAction(
                title: "Cancel",
                style: UIAlertActionStyle.Cancel) { (action: UIAlertAction!) -> Void in
            }
            
            let confirmAction = UIAlertAction(
                title: "Remove",
                style: UIAlertActionStyle.Destructive) { (action: UIAlertAction!) in
                    println("Deleted")
                    taskMgr.tasks.removeAtIndex(indexPath.row)
                    self.tblTasks.reloadData()
            }
            
            alertController.addAction(confirmAction)
            alertController.addAction(cancelAction)

            presentViewController(alertController, animated: true, completion: nil)
            
        
        }
    }
    
    
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taskMgr.tasks.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default")
        cell.textLabel?.text = taskMgr.tasks[indexPath.row].name
        cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].desc
        return cell
    }

}

