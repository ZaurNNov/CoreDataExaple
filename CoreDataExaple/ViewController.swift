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
            print("create Single Object...")
        }
        
        user = CoreDateHandler.fetchObject()
        print("current state data...")
        for i in user! {
            print("i.username: ", i.username ?? "", "i.password: ", i.password ?? "")
        }
        
        
        if CoreDateHandler.deleteObject(user: user![0]) {
            user = CoreDateHandler.fetchObject()
            print("after Single Delete...")
            
            for i in user! {
                print("i.username: ", i.username ?? "", "i.password: ", i.password ?? "")
            }
            print("user?.count: ", user?.count)
        }
        
        if CoreDateHandler.cleanDelete() {
            user = CoreDateHandler.fetchObject()
            print("all object Delete...")
            print("user?.count: ", user?.count)
        }
        
        if CoreDateHandler.saveObject(username: "Tom", password: "52497") {
            user = CoreDateHandler.fetchObject()
            print("create Single Object...")
        }
        
        if CoreDateHandler.saveObject(username: "Lisa", password: "45228") {
            user = CoreDateHandler.fetchObject()
            print("create Single Object...")
        }
        


    }

}

