//
//  TableViewController.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 15/03/23.
//

import Cocoa

class TableViewController: NSViewController {
    var mainView = TableView(frame: NSRect(x: 0, y: 0, width: 750, height: 500))
    
    override func loadView() {
        view = mainView
        mainView.wantsLayer = true
        mainView.layer?.backgroundColor = .init(gray: 0, alpha: 1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        mainView.mainTableView.dataSource = mainView
        mainView.mainTableView.delegate = mainView
        mainView.scrollView.documentView = mainView.mainTableView
        mainView.addSubview(mainView.scrollView)
        self.mainView.mainTableView.reloadData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.mainView.mainTableView.reloadData()
        }
        
        NSLayoutConstraint.activate([
            mainView.scrollView.heightAnchor.constraint(equalTo: mainView.heightAnchor),
            mainView.scrollView.widthAnchor.constraint(equalToConstant: 400),
        ])
    }
}
