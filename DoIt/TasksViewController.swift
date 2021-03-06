//
//  TasksViewController.swift
//  DoIt
//
//  Created by Julie Berry on 1/29/17.
//  Copyright © 2017 Julie Berry. All rights reserved.
//

import UIKit


class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []
    //var selectedIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    //
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    
    
    // Table view functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        // If task is important add ! in front of it
        if task.important {
            cell.textLabel?.text = "❗️\(task.name!)"
        } else {
            cell.textLabel?.text = task.name!
        }
        
        return cell
    }
    
    // Making the row selectable
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Targeting whichever row was selected so it can be deleted
//        selectedIndex = indexPath.row
        
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    

    
    
    @IBAction func plusTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "toTasks", sender: nil)
        
    }
    
    // pulling things out of Core Data and put it in to the array called tasks
    // NSFetchRequest
    
    func getTasks() {
        
        // get access to the context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
           tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        }
        catch {
            print("Unable to fetch data")
        }
        
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Handling of multiple segues
//        if segue.identifier == "addSegue" {
//            let nextVC = segue.destination as! CreateTaskViewController
//            //nextVC.previousVC = self
//        }
        
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
//            nextVC.previousVC = self
            
        }
        
        
        
    }
    
    
    



}

