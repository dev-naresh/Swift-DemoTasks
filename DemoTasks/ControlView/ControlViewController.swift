//
//  ControlViewController.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 27/02/23.
//

import Cocoa

class ControlViewController: NSViewController {

    let controlView = ControlView(frame: NSRect(x: 0, y: 0, width: 300, height: 300))
    
    override func loadView() {
        view = controlView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        controlView.wantsLayer = true
        controlView.layer?.backgroundColor = .black
        
        controlView.comboBox.action = #selector(controlView.comboText)
        controlView.comboBox.target = controlView
        
        controlView.addSubview(controlView.comboBox)
        controlView.addSubview(controlView.datePicker)
        controlView.addSubview(controlView.popUpBtn)
    }
    
}
