//
//  SecondViewController.swift
//  ToDoList
//
//  Created by mocha on 7/21/15.
//  Copyright (c) 2015 mocha. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var item: UITextField!
    @IBAction func addItem(sender: AnyObject) {
        toDOList.append(item.text);
        NSUserDefaults.standardUserDefaults().setObject(toDOList, forKey: "toDoList");
        item.text = "";
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.item.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true);
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}

