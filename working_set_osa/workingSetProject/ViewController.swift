//
//  ViewController.swift
//  workingSetProject
//
//  Created by Osa on 6/4/16.
//  Copyright © 2016 Osa. All rights reserved.
//

import Cocoa
import CoreData

class ViewController: NSViewController {

    
    
    
    @IBOutlet weak var statusLabel: NSTextField!
    
    
    @IBOutlet weak var tableView: NSTableView!
    
    
    
    @IBOutlet weak var pluralNounPopup: NSPopUpButton!
    var pluralNouns: [String]!
    
    var nameOfWS: String!
    
    var workingSets = [NSManagedObject]() //Stores instances of entity 'Working-Set'
    
    /*
     
     1) NSManagedObject represents a single object stored in Core Data- you must use it to create, edit, save and 
     delete from your Core Data persisitsnt store.
     
     2) NSManagedObject can be characterized as a "shape-shifter", meaning that it can take the form of any entity 
     within the data model, appropriating whatever attributes and relationships that you have defined.
     
     */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.setDelegate(self)
        tableView.setDataSource(self)
        tableView.target = self
 
        tableView.doubleAction = #selector(ViewController.tableViewDoubleClick(_:))
        // Do any additional setup after loading the view.
    }
    
    
    func updateStatus() {
        
        
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

       
        
        
        let text:String
        // 1
        let itemsSelected = tableView.selectedRowIndexes.count
        
        // 2
        if ( workingSets.count == 0 ) {
            text = ""
        }
        else if( itemsSelected == 0 ) {
            text =   "\(workingSets.count) items"
        }
        else
        {
            text = "\(itemsSelected) of \(workingSets.count) selected"
        }
        // 3
        statusLabel.stringValue = text
       
    }
    
    
    func tableViewDoubleClick(sender: AnyObject) {
        
        
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
        
        
        
        
        
        
        
        // 1
        /*guard tableView.selectedRow >= 0 , let item = workingSets[tableView.selectedRow] else {
            return
        }*/
        
        
        
         
         let item = workingSets[tableView.selectedRow]
         
         if(tableView.selectedRow >= 0){
         
         }
         else{
            return
         }
        
        
        
        nameOfWS = item.valueForKey("smartFOlder") as? String
        
        //print(nameOfWS)
        /*if item.isFolder {
            // 2
            self.representedObject = item.url
        } else {
            // 3  
            NSWorkspace.sharedWorkspace().openURL(item.url)
        }*/
    }
    
    override func awakeFromNib() {
        
    }
    
    
    
    @IBAction func newWindow(sender: AnyObject) {
        
        // 1
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let newWindowController = storyboard.instantiateControllerWithIdentifier("New WS") as! NSWindowController
    
        if let newWS_Window = newWindowController.window/*, textStorage = text.textStorage */{
            
            // 2
            /*let wordCountViewController = wordCountWindow.contentViewController as! WordCountViewController
            wordCountViewController.wordCount.stringValue = "\(textStorage.words.count)"
            wordCountViewController.paragraphCount.stringValue = "\(textStorage.paragraphs.count)"*/
            
            // 3
            let application = NSApplication.sharedApplication()
            
            let session = application.beginModalSessionForWindow(newWS_Window)
            //let response = application.runModalSession(session)
        
            for(;;){
            
                if( application.runModalSession(session) != NSModalResponseContinue ){
                    
                    break
                }
            }
            
            application.endModalSession(session)
            application.stopModal()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func openWindow(sender: AnyObject) {
        
        // 1
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let newWindowController = storyboard.instantiateControllerWithIdentifier("Open WS") as! NSWindowController
        
        if let newWS_Window = newWindowController.window {
            
            // 2
            /*let wordCountViewController = wordCountWindow.contentViewController as! Open_WS_Window
             wordCountViewController.wordCount.stringValue = "\(textStorage.words.count)"
             wordCountViewController.paragraphCount.stringValue = "\(textStorage.paragraphs.count)"*/
            
            // 3
            let application = NSApplication.sharedApplication()
            application.runModalForWindow(newWS_Window)
        }
    }
    
    @IBAction func editWindow(sender: AnyObject) {
        
        // 1
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let newWindowController = storyboard.instantiateControllerWithIdentifier("Edit WS") as! NSWindowController
        
        if let newWS_Window = newWindowController.window/*, textStorage = text.textStorage */{
            
            // 2
            /*let wordCountViewController = wordCountWindow.contentViewController as! WordCountViewController
             wordCountViewController.wordCount.stringValue = "\(textStorage.words.count)"
             wordCountViewController.paragraphCount.stringValue = "\(textStorage.paragraphs.count)"*/
            
            // 3
            let application = NSApplication.sharedApplication()
            application.runModalForWindow(newWS_Window)
        }
    }
    
    @IBAction func deleteWindow(sender: AnyObject) {
        
        // 1
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let newWindowController = storyboard.instantiateControllerWithIdentifier("Delete WS") as! NSWindowController
        
        if let newWS_Window = newWindowController.window/*, textStorage = text.textStorage */{
            
            // 2
            /*let wordCountViewController = wordCountWindow.contentViewController as! WordCountViewController
             wordCountViewController.wordCount.stringValue = "\(textStorage.words.count)"
             wordCountViewController.paragraphCount.stringValue = "\(textStorage.paragraphs.count)"*/
            
            // 3
            let application = NSApplication.sharedApplication()
            application.runModalForWindow(newWS_Window)
        }
    }
    
    func reloadFileList() {
        //directoryItems = directory?.contentsOrderedBy(sortOrder, ascending: sortAscending)
        tableView.reloadData()
    }
    

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        reloadFileList()
        }
    }

    
    
}

//Creates an extenstion that conforms to the NSTableViewDataSource protocol
//and implements the required the method numberOfRowsInTableView(_:) to return the number
//of 'Working Sets' which are of the size of 'workingSets' array.

extension ViewController : NSTableViewDataSource {
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        
        
        
        
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
        
        
        
        
        return workingSets.count ?? 0
    }
}

extension ViewController : NSTableViewDelegate {
    
    func tableViewSelectionDidChange(notification: NSNotification) {
        updateStatus()
    }
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
       // var image:NSImage?
        var text:String = ""
        var cellIdentifier: String = ""
        //print("Meow")
        // 1
        
        /*
         
         6/8/2016 2:04 PM
        ------------------
            I may need to include more of the CoreData functionality here to fetch a specific member.
         
         */
        
        /*guard let item = workingSets[row] else {
            return nil
        }*/
        
                /*
         
         
        
         
         
         6/8/2016 2:05 PM
         ------------------
         Here I may replace guard statement with a statement to test if the count for "workingSets" array is == 0.
         
         */
        
        
        
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

        //print (row)
        //let item = workingSets[row]
        var value = workingSets[row].valueForKey("smartFOlder") as? String
        
        
        if(value == nil){
            value = "Unnamed"
        }
        
        // 2
        if tableColumn == tableView.tableColumns[0] {
            //image = item.icon
           
            text = value!
            cellIdentifier = "NameCellID"
        } else if tableColumn == tableView.tableColumns[1] {
            text = "Value"
            cellIdentifier = "DateCellID"
        } /*else if tableColumn == tableView.tableColumns[2] {
            text = item.isFolder ? "--" : sizeFormatter.stringFromByteCount(item.size)
            cellIdentifier = "SizeCellID"
        }*/
        
        // 3
        if let cell = tableView.makeViewWithIdentifier(cellIdentifier, owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = text
            //cell.imageView?.image = image ?? nil
            return cell
        }
        return nil
    }
}