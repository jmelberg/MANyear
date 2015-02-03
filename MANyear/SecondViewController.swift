//
//  SecondViewController.swift
//  MANyear
//
//  Created by Jordan Melberg on 1/31/15.
//  Copyright (c) 2015 Jordan Melberg. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var txtTask: UITextField!
    @IBOutlet var txtDesc: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //  EVENTS // 
    @IBAction func addTaskOnClick(sender: UIButton){
        taskMgr.addTask(txtTask.text, desc: txtDesc.text)
        self.view.endEditing(true)
        txtTask.text = "" // Clear text
        txtDesc.text = ""
        self.tabBarController?.selectedIndex = 0 // Go to new tab
    }
    
    //IOS Touch Function
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) { //Removes keyboard when done typing
        self.view.endEditing(true)
    }
    
    
    //UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        textField.resignFirstResponder()
        return true
    }

}

