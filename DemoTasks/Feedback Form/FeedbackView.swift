//
//  FeedbackView.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 06/03/23.
//

import Cocoa

class FeedbackView: NSView {
    var scrollView: NSScrollView = {
        var scrollView = NSScrollView()
        scrollView.drawsBackground = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.verticalScrollElasticity = .none
        scrollView.horizontalScrollElasticity = .none
        scrollView.borderType = .bezelBorder
        scrollView.hasVerticalScroller = true
//        scrollView.layer?.cornerRadius.
//        scrollView.hasVerticalRuler = true
//        scrollView.rulersVisible = true
        scrollView.autohidesScrollers = false
        scrollView.scrollerStyle = .overlay
        scrollView.scrollerKnobStyle = .dark
        scrollView.contentInsets = NSEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
        
        return scrollView
    }()
    
    var btnView: NSView = {
        let view = NSView(frame: NSRect(x: 0, y: 0, width: 550, height: 50))
        return view
    }()
    
    var submitButton: NSButton = {
        let btn = NSButton(frame: NSRect(x: 20, y: 10, width: 100, height: 35))
        let attr = NSAttributedString(string: "Submit", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
        
        btn.wantsLayer = true
        btn.bezelStyle = .texturedRounded
        btn.setButtonType(.momentaryLight)
        btn.layer?.backgroundColor = .init(red: 0.2, green: 0.4, blue: 0.9, alpha: 1)
        btn.layer?.cornerRadius = btn.bounds.height / 4
        btn.attributedTitle = attr
        return btn
    }()
    
    var pinButton: NSButton = {
        let btn = NSButton(frame: NSRect(x: 130, y: 10, width: 35, height: 35))
        var config = NSImage.SymbolConfiguration(textStyle: .title1, scale: .small)
        let btnImg = NSImage(systemSymbolName: "paperclip", accessibilityDescription: nil)
        
        btn.wantsLayer = true
        btn.isBordered = false
        btn.setButtonType(.momentaryLight)
        btn.image = btnImg
        btn.imagePosition = .imageOnly
        config = config.applying(.init(paletteColors: [.init(red: 0.2, green: 0.4, blue: 0.9, alpha: 1)]))
        btn.image = btnImg?.withSymbolConfiguration(config)
        return btn
    }()
    
    var screenShotButton: NSButton = {
        let btn = NSButton(frame: NSRect(x: 170, y: 10, width: 35, height: 35))
        var config = NSImage.SymbolConfiguration(textStyle: .title1, scale: .small)
        let btnImg = NSImage(systemSymbolName: "camera.on.rectangle", accessibilityDescription: nil)
        
        btn.wantsLayer = true
        btn.isBordered = false
        btn.setButtonType(.momentaryLight)
        btn.image = btnImg
        btn.imagePosition = .imageOnly
        config = config.applying(.init(paletteColors: [.init(red: 0.2, green: 0.4, blue: 0.9, alpha: 1)]))
        btn.image = btnImg?.withSymbolConfiguration(config)
        return btn
    }()
    
    var feedbackForm: NSView = {
        let view = NSView(frame: NSRect(x: 300, y: 300, width: 550, height: 600))
        view.wantsLayer = true
//        view.layer?.backgroundColor = .white
        return view
    }()
    
    var titleLabelField: NSTextField = {
        let txtField = NSTextField(labelWithAttributedString: NSAttributedString(string: "Send Feedback", attributes: [NSAttributedString.Key.foregroundColor: NSColor.init(red: 0, green: 0, blue: 0, alpha: 0.7), NSAttributedString.Key.font: NSFont.systemFont(ofSize: 25, weight: .bold)]))
        txtField.translatesAutoresizingMaskIntoConstraints = false
        
        return txtField
    }()

    var subTitleLabelField: NSTextField = {
        var attString = NSMutableAttributedString(string: "Check out our Frequently Asked Questions for quick help", attributes: [NSAttributedString.Key.foregroundColor: NSColor.init(red: 0, green: 0, blue: 0, alpha: 0.7), NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
        attString.addAttribute(.link, value: "https://help.zoho.com/portal/en/kb/trident/mac/faq" , range: NSRange(location: 14, length: 27))
        let txtField = NSTextField(labelWithAttributedString: attString)
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.allowsEditingTextAttributes = true
        txtField.isSelectable = true
        txtField.attributedStringValue = attString
        return txtField
    }()
    
    var subView: NSView = {
        var view = NSView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.frame.size = NSSize(width: 400, height: 500)
        view.wantsLayer = true
        view.layer?.cornerRadius = 10
        view.layer?.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.layer?.borderWidth = 1
        return view
    }()
    
    var textView1: BorderedTextField = {
        var txtView = BorderedTextField()
        txtView.translatesAutoresizingMaskIntoConstraints = false
        txtView.focusRingType = .none
//        txtView.placeholderString = "Subject (optional)"
        txtView.alignment = .justified
//        txtView.delegate = 
        txtView.lineBreakMode = .byCharWrapping
        txtView.lineBreakStrategy = .standard
//        txtView.frame.size = NSSize(width: 400, height: 50)
//        txtView.drawsBackground = false
//        txtView.textContainer?.size = NSSize(width: 10, height: 20)
//        txtView.textContainerOrigin = NSPoint(x: txtView.textContainerOrigin.x + 10, y: txtView.textContainerOrigin.y + 10)
//        txtView.textContainer?.size = NSSize(width: txtView.bounds.size.width - 20, height: txtView.bounds.size.height - 10)
//        txtView.insertionPointColor = NSColor.black
        txtView.textColor = NSColor.black
//        txtView.sizeToFit()
//        txtView.isVerticallyResizable = true
//        txtView.isBordered = false
//        txtView.
//        txtView.backgroundColor = .black
//        txtView.cell = NSTextFieldCell(textCell: "Hello")
        
        return txtView
    }()

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
//    override func layout() {
////        textView1.textContainerInset = NSSize(width: textView1.bounds.size.width - 10, height: textView1.bounds.size.height - 10)
//    }
    
}

class BorderedTextField: NSTextField {
    var hgt: CGFloat = 50.0
    
//    var constraint: NSLayoutConstraint {
//        print(hgt)
//       return self.heightAnchor.constraint(equalToConstant: hgt)
//    }
//
    
    lazy var constraint = self.heightAnchor.constraint(equalToConstant: hgt)
//    var placeholderString = ""
//    let placeholderAttributes: [NSAttributedString.Key: Any] = [
//        .foregroundColor: NSColor.lightGray,
//        .font: NSFont.systemFont(ofSize: 14)
//    ]
//    override var textContainerOrigin: NSPoint {
//        NSPoint(x: super.textContainerOrigin.x + 10, y: super.textContainerOrigin.y + 10)
//    }
//
//    override var textContainerInset: NSSize {
//        set {
//            return
//        }
//        get {
//            NSSize(width: 10, height: 10)
//        }
//    }
    
    override var intrinsicContentSize: NSSize {
        get {
            var frame = self.frame;
            frame.size.height = CGFloat.greatestFiniteMagnitude;

            // Calculate new height within the frame
            // with practically infinite height.
            let height = self.cell!.cellSize(forBounds: self.bounds).height

            print(height)

            return NSSize(width: frame.size.width, height: height)
        }
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        let bottomLineRect = NSRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height)
        let bottomLine = NSBezierPath(rect: bottomLineRect)
        bottomLine.lineWidth = 1
        NSColor.black.setStroke()
        bottomLine.stroke()
        
        //        if string.isEmpty {
        //            let attributedString = NSAttributedString(string: placeholderString, attributes: placeholderAttributes)
        //            attributedString.draw(at: NSPoint(x: 10, y: bounds.size.height - 35))
        //        }]
        
        
        
        //        func textDidChange(_ notification: Notification) {
        //    //        print(self.string)
        ////            self.stringValue = self.string
        //            let color = CGColor.init(red: .random(in: 0.4...1), green: .random(in: 0.4...1), blue: .random(in: 0.4...1), alpha: .random(in: 0.8...1))
        //            self.textColor = NSColor(cgColor: color)
        ////            textFiel.layer?.borderColor = color
        ////            scrollView.layer?.borderColor = color
        //        }
        //    }
        
        //        override func didChangeText(){
        //            print(layoutManager?.usedRect(for: textContainer!).size.height)
        //        }
    }
    
    override func textDidChange(_ notification: Notification) {

        let color = CGColor.init(red: .random(in: 0.4...1), green: .random(in: 0.4...1), blue: .random(in: 0.4...1), alpha: .random(in: 0.8...1))
        self.textColor = NSColor(cgColor: color)
        
        self.invalidateIntrinsicContentSize()
//            print(self.intrinsicContentSize)
//            self.frame.size = self.intrinsicContentSize
//            let height = layoutManager?.usedRect(for: textContainer!).size.height
//            hgt = (layoutManager?.usedRect(for: textContainer!).size.height)!
//            print(constraint.constant)
//
//            if hgt > 50 {
//                constraint.constant = hgt
//                constraint.isActive = true
//            }
    }

}
