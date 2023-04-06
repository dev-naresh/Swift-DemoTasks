//
//  AppDelegate.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 24/02/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    let windowController = WindowController()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        windowController.showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
         
        
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

