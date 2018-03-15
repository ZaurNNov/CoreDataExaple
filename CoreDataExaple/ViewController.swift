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
        
        createExampleObjects()
        user = CoreDateHandler.filterData()
        currentState()
        
    }
    
    func createExampleObjects() {
        //clean before
        CoreDateHandler.cleanDelete()
        
        //add objects
        CoreDateHandler.saveObject(username: "123456789", password: "111111111")
        CoreDateHandler.saveObject(username: "qwertyuio", password: "ur789t87y")
        CoreDateHandler.saveObject(username: "987654321", password: "  00  00 ")
        CoreDateHandler.saveObject(username: "  mm  mm ", password: " 1     1 ")
        CoreDateHandler.saveObject(username: "!@#$- 9u8", password: "PassPassP")
        
        user = CoreDateHandler.fetchObject()
        currentState()
    }
    
    func currentState() {
        print("current state data...")
        print("user?.count: ", user?.count as Any)
        
        for i in user! {
            print("i.username: ", i.username ?? "", "i.password: ", i.password ?? "")
        }
    }
    
    func createDeleteDeleteAllCreateObjects() {
        if CoreDateHandler.saveObject(username: "Max", password: "12345") {
            user = CoreDateHandler.fetchObject()
            print("create Single Object...")
        }
        
        user = CoreDateHandler.fetchObject()
        currentState()
        
        if CoreDateHandler.deleteObject(user: user![0]) {
            user = CoreDateHandler.fetchObject()
            print("after Single Delete...")
            
            for i in user! {
                print("i.username: ", i.username ?? "", "i.password: ", i.password ?? "")
            }
        }
        
        if CoreDateHandler.cleanDelete() {
            user = CoreDateHandler.fetchObject()
            print("all object Delete...")
        }
        
        if CoreDateHandler.saveObject(username: "Tom", password: "52497"),
           CoreDateHandler.saveObject(username: "Lisa", password: "45228") {
            user = CoreDateHandler.fetchObject()
            print("create Objects...")
        }
        
        currentState()
    }

}

