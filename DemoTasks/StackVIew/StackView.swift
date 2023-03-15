//
//  StackView.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 08/03/23.
//

import Cocoa

class StackView: NSView {
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
   
    var stackView: CustomStackView = {
        var view = CustomStackView(frame: NSRect(x: 0, y: 0, width: 500, height: 500))
        view.wantsLayer = true
        view.layer?.backgroundColor = .black
        view.layer?.cornerRadius = 10
        view.distribution = .equalCentering
        view.alignment = .leading
        view.orientation = .horizontal
        view.spacing = 10
        view.setClippingResistancePriority(.defaultLow, for: .horizontal)
        view.edgeInsets = .init(top: 10, left: 10, bottom: 10, right: 10)
        
        return view
    }()
    
    var subView: () -> CustomView = {
        var view = CustomView()
        view.wantsLayer = true
        view.layer?.cornerRadius = 10
        view.layer?.backgroundColor = .init(red: .random(in: 0.3...0.7), green: .random(in: 0.3...0.7), blue: .random(in: 0.3...0.7), alpha: 0.9)
        
        return view
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
}

class CustomView : NSView {
    override var intrinsicContentSize: NSSize {
        NSSize(width: 100, height: 150)
    }
    
}

class CustomStackView: NSStackView , NSStackViewDelegate {
    func stackView(_ stackView: NSStackView, willDetach views: [NSView]) {
//        print("willDetach:", stackView.detachedViews)
    }
    
    func stackView(_ stackView: NSStackView, didReattach views: [NSView]) {
//        print("Reattaching...")
    }
}
