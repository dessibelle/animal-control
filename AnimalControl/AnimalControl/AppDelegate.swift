//
//  AppDelegate.swift
//  AnimalControl
//
//  Created by Simon Fransson on 2018-04-10.
//  Copyright © 2018 Simon Fransson. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    
    @objc func printQuote(_ sender: Any?) {
        let quoteText = "Never put off until tomorrow what you can do the day after tomorrow."
        let quoteAuthor = "Mark Twain"
        
        print("\(quoteText) — \(quoteAuthor)")
    }
    
    @objc func sendByte(_ sender: Any?) {
        /*
        #include <stdio.h>
        #include <stdlib.h>
        
        system("/Users/drummerboyx/Library/Scripts/arduino-serial -b 9600 -p /dev/tty.usbserial-A800ev0Z -s 1");
        */
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("StatusBarButtonImage"))
            button.action = #selector(printQuote(_:))
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

