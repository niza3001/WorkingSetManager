//
//  New_WS_Window.swift
//  workingSetProject
//
//  Created by Osa on 6/4/16.
//  Copyright © 2016 Osa. All rights reserved.
//

import Cocoa
import CoreData

class New_WS_Window: NSViewController {

    var managedObjectContext: NSManagedObjectContext!
    
    
    @IBOutlet weak var nameOfWS: NSTextField!
    
    var workingSets = [NSManagedObject]() //Stores instances of entity 'Working-Set'
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func awakeFromNib() {
        nameOfWS.stringValue = "Name of Working set"
    }
    
    @IBAction func dismissNewWindow(sender: NSButton) {
        let application = NSApplication.sharedApplication()
        
        //1
        let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        
        //2
        let entity = NSEntityDescription.entityForName("Working_Set", inManagedObjectContext: managedContext)
        
        
        let workingSet = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        //3
        workingSet.setValue(nameOfWS.stringValue, forKey: "smartFOlder")
        
        //4
        do {
            try managedContext.save()
            //5
            workingSets.append(workingSet)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        
        
        
        
        
        
        application.stopModal()
        //print("Does it work.")
        //let myString = nameOfWS.stringValue
        //print(myString)x
        //application.endModalSession(application)
    }
    
    
    
    
    
    
    
    
    
    
    @IBAction func CancelWindow(sender: NSButton) {
        let application = NSApplication.sharedApplication()
        
        
        //1
        let appDelegate =
            NSApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Working_Set")
        //3
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            workingSets = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        let value = workingSets[0].valueForKey("smartFOlder") as? String
        //print("value")
        
        
        let specific_workingSet = workingSets[0]
        specific_workingSet.setValue(nameOfWS.stringValue, forKey: "smartFOlder")
        print(value)
        
        application.abortModal()
        //print("Woof")
    }
}
