//
//  CoreDateHandler.swift
//  CoreDataExaple
//
//  Created by A1 on 14.03.2018.
//  Copyright © 2018 A1. All rights reserved.
//

import UIKit
import CoreData

class CoreDateHandler: NSObject {
    
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
    class func saveObject(username: String, password: String) -> Bool {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let managedObject = NSManagedObject(entity: entity!, insertInto: context)
        
        managedObject.setValue(username, forKey: "username")
        managedObject.setValue(password, forKey: "password")
        
        do {
            try context.save()
            print("saveObject(username: String, password: String)... OK")
            return true
        } catch  {
            print ("saveObject(username: String, password: String) -> Bool - FAILED")
            return false
        }
    }

    class func fetchObject() -> [User]? {
        let context = getContext()
        var user: [User]? = nil
        do {
            user = try context.fetch(User.fetchRequest())
            print("fetchObject() -> [User]?... OK")
            return user
        } catch {
            print ("fetchObject() -> [User]? - FAILED")
            return user
        }
    }
    

    class func deleteObject(user: User) -> Bool {
        let context = getContext()
        context.delete(user)
        
        do {
            try context.save()
            print("deleteObject(user: User)... OK")
            return true
        } catch {
            print ("deleteObject(user: User) -> Bool - FAILED")
            return false
        }
    }
    
    class func cleanDelete() -> Bool {
        let context = getContext()
        let delete = NSBatchDeleteRequest(fetchRequest: User.fetchRequest())
        
        do {
            try context.execute(delete)
            print("cleanDelete()... OK")
            return true
        } catch {
            print ("cleanDelete() -> Bool - FAILED")
            return false
        }
    }
}
