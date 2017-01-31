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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // Create a Task from the outlet's information
        // NSManagedObjectContext looking into the database
        let task = Task(context: context)
        
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        // Save Pop Back

        navigationController!.popViewController(animated: true)
        
    }
    

    

}
