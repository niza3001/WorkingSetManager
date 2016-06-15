//
//  Edit_WS_Window.swift
//  workingSetProject
//
//  Created by Osa on 6/4/16.
//  Copyright © 2016 Osa. All rights reserved.
//

import Cocoa

class Edit_WS_Window: NSViewController {

    /* Note: Var 'managedObjectContext', holds object of class, 'NSManagedObjectContext',
     responible for creating a representational "scratchpad" or "object space" to work with
     managed objects (Entities of CoreData object graph.)                               */
    //var managedObjectContext: NSManagedObjectContext!
    
    
    var workingSets = [NSManagedObject]() //Stores instances of entity 'Working-Set'
    
    /* Note: Var 'workingSets' holds object of class, 'NSManagedObject'. This instance of the class
     represents a single object stored within CoreData, enabling the the creation,editing, saving, and
     deletion of assocaited entities from CoreData. Can take on the form of any entity from data model.*/
    //var workingSets = [NSManagedObject]()
    
    
    @IBOutlet weak var nameOfWS: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    @IBAction func dismissEditWindow(sender: NSButton) {
        
        let application = NSApplication.sharedApplication()
        
                let appDelegate =
            NSApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Working_Set")
        //3
        //2 - Predicate
        let predicate = NSPredicate(format: "%K == %@","smartFOlder","\(nameOfWS.stringValue)")
        fetchRequest.predicate = predicate
        
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            workingSets = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
       // _ = workingSets.valueForKey("smartFOlder") as? String
        //print("value")
        
        /*let specific_workingSet = workingSets[0]
        specific_workingSet.setValue(nameOfWS.stringValue, forKey: "smartFOlder")
        
        
        //4
        do {
            try managedContext.save()
            //5
            //workingSets.append(workingSet)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        */
        
        
        //3 - Add Sort Descriptor
        //let sortDescriptor1 = NSSortDescriptor(key: "smartFOlder", ascending: true)
        //fetchRequest.sortDescriptors = [sortDescriptor1]
        

        
        
        
        
        
        /*
        //4 - Execture Fetch Request
        do{
            
            
            let result = try managedContext.executeFetchRequest(fetchRequest)
            
            for managedObject in result {
                //if let first = managedObject.objectAtIndex(result){
                //print("Deleting \(first)")
                managedContext.setValue(nameOfWS.stringValue, forKey: "smartFOlder")
                print("Yes")
            }
            print("Yes")
        } catch{
            let fetchError = error as NSError
            print(fetchError)
        }*/
        /*
        //4
        do {
            try managedContext.save()
            //5
           // workingSets.append(workingSet)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        
        
        
        //////////
        //let specific_workingSet = workingSets[0]
        //specific_workingSet.setValue(nameOfWS.stringValue, forKey: "smartFOlder")
        ////////
        
        
        */
        
        
        application.stopModal()
    }
    
    @IBAction func CancelWindow(sender: NSButton) {
        let application = NSApplication.sharedApplication()
        application.stopModal()
    }
}
