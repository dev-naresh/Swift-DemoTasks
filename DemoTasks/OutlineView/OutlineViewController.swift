//
//  OutlineViewController.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 30/03/23.
//

import Cocoa

class OutlineViewController: NSViewController {
    var mainView = OutlineView(frame: NSRect(x: 0, y: 0, width: 750, height: 500))

    override func loadView() {
        view = mainView
        mainView.wantsLayer = true
        mainView.layer?.backgroundColor = .init(gray: 0, alpha: 1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.scrollView.translatesAutoresizingMaskIntoConstraints = false

        mainView.mainOutlineView.dataSource = mainView
        mainView.mainOutlineView.delegate = mainView
        mainView.scrollView.documentView = mainView.mainOutlineView
        mainView.addSubview(mainView.scrollView)

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.mainView.mainOutlineView.reloadData()
        }

        NSLayoutConstraint.activate([
            mainView.scrollView.heightAnchor.constraint(equalTo: mainView.heightAnchor),
            mainView.scrollView.widthAnchor.constraint(equalToConstant: 400),
        ])
    }
    
}
