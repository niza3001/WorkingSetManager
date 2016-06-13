//
//  Delete_WS_Window.swift
//  workingSetProject
//
//  Created by Osa on 6/4/16.
//  Copyright © 2016 Osa. All rights reserved.
//

import Cocoa
import CoreData

class Delete_WS_Window: NSViewController {
    
    
    var managedObjectContext: NSManagedObjectContext!
    
    @IBOutlet weak var nameOfWS: NSTextField!
    
    var workingSets = [NSManagedObject]() //Stores instances of entity 'Working-Set'

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    @IBAction func DeleteNewWindow(sender: NSButton) {
        let application = NSApplication.sharedApplication()
        
        //1
        let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        
        print("Hello, \(nameOfWS.stringValue)")
        let name = nameOfWS.stringValue
        //1 - Fetching
        let fetchRequest = NSFetchRequest(entityName: "Working_Set")
       
        
        //2 - Predicate
        let predicate = NSPredicate(format: "%K == %@","smartFOlder","\(name)")
        fetchRequest.predicate = predicate
        
        //3 - Add Sort Descriptor
        //let sortDescriptor1 = NSSortDescriptor(key: "smartFOlder", ascending: true)
        //fetchRequest.sortDescriptors = [sortDescriptor1]
        
        //4 - Execture Fetch Request
        do{
           
            
            let result = try managedContext.executeFetchRequest(fetchRequest)
            
            for managedObject in result {
                //if let first = managedObject.objectAtIndex(result){
                    //print("Deleting \(first)")
                    managedContext.deleteObject(managedObject as! NSManagedObject)
                    
                //}
            }
        } catch{
            let fetchError = error as NSError
            print(fetchError)
        }
 
        
        
        
        
        application.stopModal()
    }
    
    @IBAction func CancelWindow(sender: NSButton) {
        let application = NSApplication.sharedApplication()
        application.stopModal()
    }
}
