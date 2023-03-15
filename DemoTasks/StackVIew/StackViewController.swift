//
//  StackVIewController.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 08/03/23.
//

import Cocoa

class StackViewController: NSViewController {
    var mainView = StackView(frame: NSRect(x: 0, y: 0, width: 500, height: 500))
    var view1 = CustomView()
    var view2 = CustomView()
    var popOverController = PopoverViewController()
    var btn = NSButton(frame: NSRect(x: 100, y: 100, width: 30, height: 100))
    var number = 2
    let noOfSubview = 10
    let viewToBeHidden: Float = 2
    
    @objc func togglePopover(_ sender: Any?) {
        if popOverController.popOverView.isShown {
        closePopover(sender: sender)
      } else {
        showPopover(sender: sender)
      }
    }

    func showPopover(sender: Any?) {
        popOverController.popOverView.detachedView = mainView.stackView.detachedViews
        popOverController.popOverView.show(relativeTo: mainView.stackView.bounds, of: mainView.stackView, preferredEdge: NSRectEdge.minY)
    }

    func closePopover(sender: Any?) {
        popOverController.popOverView.performClose(sender)
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.wantsLayer = true
        view1.layer?.backgroundColor = .black
        view2.wantsLayer = true
        view2.layer?.backgroundColor = .white
        
        btn.attributedTitle = NSAttributedString(string: "View more", attributes: [NSAttributedString.Key.foregroundColor: NSColor.systemBlue])
        btn.action = #selector(togglePopover)
        btn.isBordered = false
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        
        mainView.stackView.delegate = mainView.stackView
        mainView.stackView.translatesAutoresizingMaskIntoConstraints = false
        var i = 0
        while i < noOfSubview {
            mainView.stackView.addView(mainView.subView(), in: .leading)
            i += 1
        }
        
        for subview in mainView.stackView.views {
            if Float(mainView.stackView.views.firstIndex{$0 == subview}!) >= viewToBeHidden {
                mainView.stackView.setVisibilityPriority(.init(rawValue: Float(mainView.stackView.views.firstIndex{$0 == subview}!)), for: subview)
            }
        }
        
        popOverController.popOverView.behavior = .transient
        popOverController.popOverView.contentViewController = popOverController
        
        mainView.addSubview(btn)
        mainView.addSubview(mainView.stackView)
        
        NSLayoutConstraint.activate([
            mainView.stackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            mainView.stackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            mainView.stackView.widthAnchor.constraint(equalTo: mainView.widthAnchor,multiplier: 0.9),
            mainView.stackView.topAnchor.constraint(greaterThanOrEqualTo: mainView.centerYAnchor, constant: -100),
            mainView.stackView.bottomAnchor.constraint(lessThanOrEqualTo: mainView.centerYAnchor, constant: 100),
            
            mainView.stackView.views[mainView.stackView.views.count - 1].trailingAnchor.constraint(lessThanOrEqualTo: mainView.stackView.trailingAnchor, constant: 10),
            
            btn.bottomAnchor.constraint(equalTo: mainView.stackView.topAnchor, constant: -10),
            btn.trailingAnchor.constraint(equalTo: mainView.stackView.trailingAnchor),
            btn.topAnchor.constraint(greaterThanOrEqualTo: mainView.topAnchor, constant: 10),
        ])
        
        for subview in mainView.stackView.views {
            subview.topAnchor.constraint(equalTo: mainView.stackView.topAnchor, constant: 10).isActive = true
            subview.bottomAnchor.constraint(equalTo: mainView.stackView.bottomAnchor, constant: -10).isActive = true
        }
    }
    
    override func viewWillLayout() {
        var i = 2
        for subview in popOverController.popOverView.detachedView {
            mainView.stackView.insertView(subview, at: i, in: .leading)
            i += 1
        }
        
        for subview in mainView.stackView.views {
            if Float(mainView.stackView.views.firstIndex{$0 == subview}!) >= viewToBeHidden {
                print(Float(mainView.stackView.views.firstIndex{$0 == subview}!))
                mainView.stackView.setVisibilityPriority(.init(rawValue: Float(mainView.stackView.views.firstIndex{$0 == subview}!)), for: subview)
            }
        }
        
//        for subview in mainView.stackView.views {
//            mainView.stackView.setVisibilityPriority(.init(rawValue: Float(mainView.stackView.views.firstIndex{$0 == subview}!)), for: subview)
//            mainView.stackView.setVisibilityPriority(.init(rawValue: Float(i)), for: subview)
//            print(mainView.stackView.visibilityPriority(for: subview))
//        }
        
//        print(mainView.stackView.views)
        
//        for subview in mainView.stackView.views {
//            if Float(mainView.stackView.views.firstIndex{$0 == subview}!) >= viewToBeHidden, !mainView.stackView.detachedViews.contains(subview) {
//                mainView.stackView.setVisibilityPriority(.init(rawValue: Float(mainView.stackView.views.firstIndex{$0 == subview}!)), for: subview)
//            }
//////            print(mainView.stackView.visibilityPriority(for: subview))
//        }
        
        
    }
}


class PopoverViewController: NSViewController {
    var popOverView = CustomPopover()
    
    override func loadView() {
        self.view = popOverView.scrollView
    }
    
    override func viewDidLoad() {
        popOverView.scrollView.stackView.layer?.backgroundColor = .clear
        popOverView.scrollView.stackView.distribution = .gravityAreas
        
        popOverView.scrollView.stackView.delegate = popOverView.scrollView.stackView
        popOverView.scrollView.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        popOverView.scrollView.addSubview(popOverView.scrollView.scrollView)
        popOverView.scrollView.scrollView.documentView = popOverView.scrollView.stackView
        
        NSLayoutConstraint.activate([
            popOverView.scrollView.widthAnchor.constraint(equalToConstant: 300),
            
            popOverView.scrollView.scrollView.centerXAnchor.constraint(equalTo: popOverView.scrollView.centerXAnchor),
            popOverView.scrollView.scrollView.centerYAnchor.constraint(equalTo: popOverView.scrollView.centerYAnchor),
            popOverView.scrollView.scrollView.widthAnchor.constraint(greaterThanOrEqualToConstant: 230),
            popOverView.scrollView.scrollView.heightAnchor.constraint(equalToConstant: 180),
            
            popOverView.scrollView.stackView.leadingAnchor.constraint(equalTo: popOverView.scrollView.scrollView.leadingAnchor),
            popOverView.scrollView.stackView.topAnchor.constraint(equalTo: popOverView.scrollView.scrollView.topAnchor),
            popOverView.scrollView.stackView.bottomAnchor.constraint(equalTo: popOverView.scrollView.scrollView.bottomAnchor),
            popOverView.scrollView.stackView.widthAnchor.constraint(greaterThanOrEqualToConstant: 230),
        ])

        
    }
    
    override func viewDidAppear() {
        var i: Float = 2.0
        
        for view in popOverView.detachedView {
            popOverView.scrollView.stackView.addView(view, in: .leading)
            popOverView.scrollView.stackView.setVisibilityPriority(.init(i), for: view)
            i += 1
        }
        
        for subview in popOverView.detachedView {
            subview.topAnchor.constraint(equalTo: popOverView.scrollView.stackView.topAnchor, constant: 10).isActive = true
            subview.bottomAnchor.constraint(equalTo: popOverView.scrollView.stackView.bottomAnchor, constant: -10).isActive = true
        }
    }
}

class CustomPopover: NSPopover, NSPopoverDelegate {
    var scrollView = StackView(frame: NSRect(x: 0, y: 0, width: 100, height: 200))
    var detachedView: [NSView] = []
    
    func popoverDidClose(_ notification: Notification) {
        detachedView = scrollView.stackView.views
    }
}
