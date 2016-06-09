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
//////////////////////////////////////////////////////////////////////////////////////////
/* Note: START OF CLASS                                                                  */
//////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    
    
    
    
    
    /*Note: Stores instances of entity 'Working-Set' */
    var workingSets = [NSManagedObject]()

    
    
    /*Note: Function, 'viewDidLoad()' is called when the view UI of this class is loaded on the display,
     indicating that it it ready to perform some aciton. Can be thought of as the "main" of this View
     Controller. www.reddit.com/r/swift/comments/39v3s6/what_exactly_is_the_purpose_of_viewdidload/ */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    
    //////////////////////////////////////////////////////////////////////////////////////////
    /* FUNCTION: 'IBAction func 'dismissEditWindow(sender: NSButton)'                        */
    //////////////////////////////////////////////////////////////////////////////////////////
    /*Note: This IBAction function serves the purpose of committing the deletion of an entity
     for the data model to a persistent store through
     NSManagedObject's method, ".save()".                       */
    @IBAction func DeleteNewWindow(sender: NSButton) {
        let application = NSApplication.sharedApplication()
        
        
        
        
        
        
        
        
        
        
        application.stopModal()
    }
    
    
    //////////////////////////////////////////////////////////////////////////////////////////
    /* FUNCTION: 'IBAction func 'CancelWindow(sender: NSButton)'                            */
    //////////////////////////////////////////////////////////////////////////////////////////
    /*Note: This IBAction function serves the purpose of closing the Modal Window upon pressing
     button, 'Cancel'.*/
    @IBAction func CancelWindow(sender: NSButton) {
        let application = NSApplication.sharedApplication()
        application.stopModal()
    }
//////////////////////////////////////////////////////////////////////////////////////////
/* Note: END OF CLASS                                                                  */
//////////////////////////////////////////////////////////////////////////////////////////
}
