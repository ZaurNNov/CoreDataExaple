//
//  ViewController.swift
//  CoreDataExaple
//
//  Created by A1 on 14.03.2018.
//  Copyright © 2018 A1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var user: [User]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CoreDateHandler.saveObject(username: "Max", password: "12345") {
            user = CoreDateHandler.fetchObject()
            
            for i in user! {
                print("i.username: ", i.username ?? "", "i.password: ", i.password ?? "")
            }
        }

    }

}

