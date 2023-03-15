//
//  ControlView.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 27/02/23.
//

import Cocoa

class ControlView: NSView {
    
    @objc func comboText(selector: NSComboBox) {
        var flag = 0
        for value in selector.objectValues {
            if value as? String == selector.stringValue { flag = 1 }
        }
        if flag == 0 {
            selector.addItem(withObjectValue: selector.stringValue)
            flag = 0
        }
        
        print(selector.stringValue)
    }
    
    var comboBox: NSComboBox = {
        var comboBox = NSComboBox(frame: NSRect(x: 100, y: 100, width: 100, height: 35))
//        comboBox.wantsLayer = true
//        comboBox.layer?.backgroundColor = .white
        comboBox.layer?.bounds = NSRect(x: 0, y: 0, width: 100, height: 35)
        comboBox.layer?.borderWidth = 2
        comboBox.layer?.borderColor = .black
        comboBox.addItems(withObjectValues: ["Naresh", "Naveen", "Sanjay", "Saravana", "Harish", "Suba"])
        comboBox.alignment = .left
        comboBox.hasVerticalScroller = true
        comboBox.intercellSpacing = NSSize(width: 80, height: 10)
        comboBox.numberOfVisibleItems = 3
//        comboBox.isBordered = true
        
        
        return comboBox
    }()

    var datePicker: NSDatePicker = {
        var datePick = NSDatePicker(frame: NSRect(x: 100, y: 200, width: 200, height: 35))
//        datePick.wantsLayer = true
        datePick.layer?.backgroundColor = .clear
        datePick.layer?.cornerRadius = datePick.bounds.height / 4
//        datePick.layer?.bounds = NSRect(x: 0, y: 0, width: 100, height: 35)
        datePick.layer?.borderWidth = 2
        datePick.layer?.borderColor = .white
        datePick.datePickerStyle = .textFieldAndStepper
        datePick.backgroundColor = .white
        datePick.textColor = .black
        datePick.alignment = .center
        datePick.isBordered = true
        datePick.isBezeled = false
        datePick.timeZone = .current
        datePick.drawsBackground = true
//        comboBox.isBordered = true
        return datePick
    }()
    
    var popUpBtn: NSPopUpButton = {
        var popUp = NSPopUpButton(frame: NSRect(x: 100, y: 300, width: 150, height: 35), pullsDown: true)
        
        popUp.addItems(withTitles: ["Run", "Build", "Debug", "Stop"])
//        popUp.cell.arrow
        return popUp
    }()

    override func draw(_ dirtyRect: NSRect) {
//        super.draw(dirtyRect)
        let path = NSBezierPath()
        path.move(to: NSPoint(x: 0, y: 0))
        path.line(to: NSPoint(x: 100, y: 100))
//        path.appendRect(NSRect(x: 100, y: 100, width: 1000, height: 100))
//        path.fill()
        path.lineWidth = 2
        NSColor.green.set()
        path.close()
        path.stroke()
    }
    
}
