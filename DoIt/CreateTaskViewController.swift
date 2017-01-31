//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Julie Berry on 1/29/17.
//  Copyright © 2017 Julie Berry. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    // property connecting to the previous view controller - then go to segue and add elements
    //var previousVC = TasksViewController()
    
    var previousVC = TasksViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func addTapped(_ sender: Any) {
        
        // Create a Task from the outlet's information
        let task = Task()
        
        if taskNameTextField != nil {
            task.name = taskNameTextField.text!
        }

        task.important = importantSwitch.isOn
        
        // Add the new task to the array in the previous view controller
        previousVC.tasks.append(task)
        
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
        
    }
    

    

}
