//
//  Window.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 24/02/23.
//

import Cocoa

class Window: NSWindow {
    convenience init() {
//        self.init(contentViewController: ButtonViewController())
//        self.init(contentViewController: ControlViewController())
//        self.init(contentViewController: TextViewController())
//        self.init(contentViewController: FeedbackViewController())
        self.init(contentViewController: StackViewController())
//        self.init(contentViewController: TableViewController())
//        self.init(contentViewController: OutlineViewController())
        
    }
}
