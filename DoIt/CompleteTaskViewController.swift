//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Julie Berry on 1/29/17.
//  Copyright © 2017 Julie Berry. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    
    @IBOutlet weak var completedTaskLabel: UILabel!
    
    var task = Task()
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting data that should be in the label
        completedTaskLabel.text = task.name
        if task.important {
            completedTaskLabel?.text = "❗️\(task.name)"
            
        } else {
            completedTaskLabel?.text = task.name
        }

        
    }
    
    // Removing the selected task
    @IBAction func completeTapped(_ sender: Any) {
        
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
    

  
}
