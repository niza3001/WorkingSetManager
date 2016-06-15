//
//  Open_WS_Window.swift
//  workingSetProject
//
//  Created by Osa on 6/4/16.
//  Copyright © 2016 Osa. All rights reserved.
//

import Cocoa

class Open_WS_Window: NSViewController {
//////////////////////////////////////////////////////////////////////////////////////////
/* Note: START OF CLASS                                                                  */
//////////////////////////////////////////////////////////////////////////////////////////
    
    
    var smartFolder:String?
    
    //////////////////////////////////////////////////////////////////////////////////////////
    /*  FUNCTION:      'override func viewDidLoad()'                                   */
    //////////////////////////////////////////////////////////////////////////////////////////
    /*Note: Function, 'viewDidLoad()' is called when the view UI of this class is loaded on the display,
     indicating that it it ready to perform some action. Can be thought of as the "main" of this View
     Controller. www.reddit.com/r/swift/comments/39v3s6/what_exactly_is_the_purpose_of_viewdidload/ */
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Open_WS_Window is opened.")
        // Do view setup here.
    }
    
    
    
    @IBAction func dismissOpenWindow(sender: NSButton) {
        
       smartFolder = "/Users/Osa/Desktop"
        
        if(smartFolder != nil){
        NSWorkspace.sharedWorkspace().selectFile(nil, inFileViewerRootedAtPath: smartFolder!)
        
        
        let application = NSApplication.sharedApplication()
        application.stopModal()
        }
        else {
            return
        }
    }
    
    
    
    @IBAction func CancelWindow(sender: NSButton) {
        let application = NSApplication.sharedApplication()
        application.stopModal()
    }
    
//////////////////////////////////////////////////////////////////////////////////////////
/* Note: END OF CLASS                                                                  */
//////////////////////////////////////////////////////////////////////////////////////////
}
