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
        
        do {
            var deliverablePathString = "/Users/Osa/Desktop/\(nameOfWS.stringValue)"
            try NSFileManager.defaultManager().createDirectoryAtPath(deliverablePathString, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            NSLog("\(error.localizedDescription)")
        } catch {
            print("general error - \(error)")
        }
        
        
        
        
        
        application.stopModal()
    }
    
    @IBAction func CancelWindow(sender: NSButton){
        let application = NSApplication.sharedApplication()
        application.abortModal()
    }
}
