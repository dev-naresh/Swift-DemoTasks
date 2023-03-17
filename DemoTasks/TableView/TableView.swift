//
//  TableView.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 15/03/23.
//

import Cocoa

class TableView: NSView {
    var scrollView: NSScrollView = {
        var scrollView = NSScrollView()
        scrollView.drawsBackground = false
        scrollView.borderType = .noBorder
        scrollView.scrollerStyle = .overlay
        scrollView.scrollerKnobStyle = .dark
        scrollView.verticalScrollElasticity = .none
        scrollView.horizontalScrollElasticity = .none
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInsets = NSEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
        
        return scrollView
    }()
    
    var tableView: NSTableView = {
        var view = NSTableView()
        view.backgroundColor = .blue
        var column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("Column"))
        column.title = "Color"
        view.addTableColumn(column)
        
        
        return view
    }()

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
}
