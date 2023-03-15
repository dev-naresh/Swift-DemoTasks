//
//  TextViewController.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 01/03/23.
//

import Cocoa

class TextViewController: NSViewController {
    var mainView = NSView(frame: NSRect(x: 0, y: 0, width: 400, height: 400))
    var textView = TextView(frame: NSRect(x: 100, y: 100, width: 2908, height: 2000))
    
    override func loadView() {
        view = mainView
        mainView.wantsLayer = true
        mainView.layer?.backgroundColor = .black
        
        textView.scrollView.documentView = textView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.addSubview(textView.scrollView)
        mainView.addSubview(textView.textField)
        mainView.addSubview(textView.smallText)
        
        NSLayoutConstraint.activate([
            textView.scrollView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 100),
//            scrollView.topAnchor.constraint(equalTo: centerYAnchor, constant: 20),
            textView.scrollView.bottomAnchor.constraint(lessThanOrEqualTo: mainView.bottomAnchor, constant: -100),
            textView.scrollView.widthAnchor.constraint(equalToConstant: 300),
//            scrollView.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor),
            textView.scrollView.heightAnchor.constraint(lessThanOrEqualToConstant: 150),
            textView.scrollView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
        ])
    }
}
