//
//  TableViewController.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 15/03/23.
//

import Cocoa

class TableViewController: NSViewController {
    var mainView = TableView(frame: NSRect(x: 0, y: 0, width: 300, height: 300))
    
    override func loadView() {
        view = mainView
        mainView.wantsLayer = true
        mainView.layer?.backgroundColor = .black
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        mainView.tableView.frame = NSRect(x: 0, y: 0, width: 200, height: mainView.bounds.height)
        mainView.scrollView.frame = NSRect(x: 0, y: 0, width: 300, height: mainView.bounds.height)
//        mainView.scrollView.documentView =
        
        mainView.scrollView.documentView = mainView.tableView
        mainView.addSubview(mainView.scrollView)
        
        NSLayoutConstraint.activate([
            
        ])
    }
    
}
