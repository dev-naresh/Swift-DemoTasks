//
//  ButtonViewController.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 24/02/23.
//

import Cocoa

class ButtonViewController: NSViewController {
    
    let btnView = ButtonView(frame: NSRect(x: 0, y: 0, width: 300, height: 300))
    
    override func loadView() {
        view = btnView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        btnView.wantsLayer = true
        btnView.layer?.backgroundColor = .black
//            .init(red: 0.5, green: 0.65, blue: 0.8, alpha: 0.8)
        
        btnView.button.wantsLayer = true
//        btnView.button.layer?.frame = NSRect(x: 0, y: 0, width: 100, height: 50)

//        btnView.addSubview(btnView.button)
    }
    
}
