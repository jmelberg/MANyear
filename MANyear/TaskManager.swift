//
//  TaskManager.swift
//  MANyear
//
//  Created by Jordan Melberg on 1/31/15.
//  Copyright (c) 2015 Jordan Melberg. All rights reserved.
//
import UIKit

var taskMgr: TaskManager = TaskManager()

struct task {
    var name = "No name"
    var desc = "No description"
    
}

class TaskManager: NSObject {



    var tasks = [task]()
    
    func addTask(name: String, desc: String){
        tasks.append(task(name: name, desc: desc))
    }
    
}
