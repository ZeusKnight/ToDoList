//
//  FirstViewController.swift
//  ToDoList
//
//  Created by mocha on 7/21/15.
//  Copyright (c) 2015 mocha. All rights reserved.
//

import UIKit

var toDOList = [String]();

class FirstViewController: UIViewController, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil) {
            toDOList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String];
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDOList.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell");
        cell.textLabel?.text = toDOList[indexPath.row];
        return cell;
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData();
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if(editingStyle == UITableViewCellEditingStyle.Delete) {
            toDOList.removeAtIndex(indexPath.row);
            NSUserDefaults.standardUserDefaults().setObject(toDOList, forKey: "toDoList");
            tableView.reloadData();
        }
    }
}

