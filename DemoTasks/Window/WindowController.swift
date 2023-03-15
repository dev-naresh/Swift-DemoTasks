//
//  WindowController.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 24/02/23.
//

import Cocoa

class WindowController: NSWindowController {
    convenience init() {
        self.init(window: Window())
        window?.styleMask = [.closable, .resizable, .miniaturizable, . titled]
        window?.title = "Demo Task"
//        window?.aspectRatio =  NSSize(width: 800, height: 500)
        window?.aspectRatio =  NSSize(width: 750, height: 500)
        window?.minSize = NSSize(width: 260, height: 175)
//        window?.backgroundColor = .white
    }
}
