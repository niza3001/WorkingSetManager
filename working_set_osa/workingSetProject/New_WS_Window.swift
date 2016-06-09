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
//////////////////////////////////////////////////////////////////////////////////////////
/* Note: START OF CLASS                                                                  */
//////////////////////////////////////////////////////////////////////////////////////////
    
    
    /* Note: This is the outlet for the text being modified within the 'New' modal window. */
    @IBOutlet weak var nameOfWS: NSTextField!
    
    
    /* Note: Var 'managedObjectContext', holds object of class, 'NSManagedObjectContext', 
     responible for creating a representational "scratchpad" or "object space" to work with
     managed objects (Entities of CoreData object graph.)                               */
    var managedObjectContext: NSManagedObjectContext!
   
    
    
    
    /* Note: Var 'workingSets' holds object of class, 'NSManagedObject'. This instance of the class
     represents a single object stored within CoreData, enabling the the creation,editing, saving, and
     deletion of assocaited entities from CoreData. Can take on the form of any entity from data model.*/
    var workingSets = [NSManagedObject]()
    
    
    
    //////////////////////////////////////////////////////////////////////////////////////////
    /*  FUNCTION:      'override func viewDidLoad()'                                   */
    //////////////////////////////////////////////////////////////////////////////////////////
    /*Note: Function, 'viewDidLoad()' is called when the view UI of this class is loaded on the display,
     indicating that it it ready to perform some aciton. Can be thought of as the "main" of this View
     Controller. www.reddit.com/r/swift/comments/39v3s6/what_exactly_is_the_purpose_of_viewdidload/ */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    
    //////////////////////////////////////////////////////////////////////////////////////////
    /*  FUNCTION:        'override func awakeFromNib()'                                */
    //////////////////////////////////////////////////////////////////////////////////////////
    /*Note:  Function, "awakeFromNib()" prepares the receiver for service after it has been loaded 
     from an Interface Builder archive, or nib file.  Here, the default value of the IBOutlet is
     defined here.   */
    override func awakeFromNib() {
        nameOfWS.stringValue = "Name of Working set"
    }
    
    
    
    //////////////////////////////////////////////////////////////////////////////////////////
    /* FUNCTION: 'IBAction func 'dismissNewWindow(sender: NSButton)'                        */
    //////////////////////////////////////////////////////////////////////////////////////////
    /*Note: This IBAction function serves the purpose of committing the creation of a new entity
     for the data model to a persistent store through
     NAManagedObject's method, ".save()".                       */
    @IBAction func dismissNewWindow(sender: NSButton) {
        
        //1.1 - Constant holds the value of the running application instance.
        let application = NSApplication.sharedApplication()
        
            //2.1
                let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
            
                let managedContext = appDelegate.managedObjectContext
            
            
            //2.2
                let entity = NSEntityDescription.entityForName("Working_Set", inManagedObjectContext: managedContext)
            
            
                let workingSet = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        
            //2.3
                workingSet.setValue(nameOfWS.stringValue, forKey: "smartFOlder")
        
        
            //2.4
                do {
                    try managedContext.save()
                    //2.5
                    workingSets.append(workingSet)
                } catch let error as NSError  {
                    print("Could not save \(error), \(error.userInfo)")
                }
        
        
        //1.2 - Function of object application is invoked to signal the end of the modal window.
        application.stopModal()
    }
    
    
    
    //////////////////////////////////////////////////////////////////////////////////////////
    /* FUNCTION: 'IBAction func 'CancelWindow(sender: NSButton)'                            */
    //////////////////////////////////////////////////////////////////////////////////////////
    /*Note: This IBAction function serves the purpose of closing the Modal Window upon pressing
     button, 'Cancel'.*/
    @IBAction func CancelWindow(sender: NSButton) {
        let application = NSApplication.sharedApplication()
        
        
            /*Note: To be moved into Edit_WS_window.swift.*/
            /*//1
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
        
        
            
            
            
            let specific_workingSet = workingSets[0]
            specific_workingSet.setValue(nameOfWS.stringValue, forKey: "smartFOlder")
            */
        
        application.abortModal()
        
    }
//////////////////////////////////////////////////////////////////////////////////////////
/* Note: END OF CLASS                                                                  */
//////////////////////////////////////////////////////////////////////////////////////////
}
