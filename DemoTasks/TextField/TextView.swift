//
//  TextView.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 01/03/23.
//

import Cocoa

class PaddedTextField: NSTextField {
    // The amount of padding to add on all sides
    let padding = NSEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)

    override func draw(_ dirtyRect: NSRect) {
        // Get the current drawing context
        guard let context = NSGraphicsContext.current?.cgContext else {
            super.draw(dirtyRect)
            return
        }
        
        // Save the current graphics state
        context.saveGState()
        
        // Add padding to the bounds of the text field
        let paddedBounds = bounds.insetBy(dx: 0, dy: (bounds.height - intrinsicContentSize.height) / 2)
        
        // Draw the background
        NSColor.white.setFill()
        context.fill(paddedBounds)
        
        // Draw the text
        let textRect = paddedBounds.offsetBy(dx: 0, dy: (bounds.height - intrinsicContentSize.height) / 2)
        super.draw(textRect)
        
        // Restore the graphics state
        context.restoreGState()
    }
}

class TextView: NSTextView, NSTextViewDelegate {
    var textField = NSTextField(frame: NSRect(x: 500, y: 500, width: 400, height: 400))
    var scrollView = NSScrollView(frame: NSRect(x: 100, y: 100, width: 300, height: 100))
    let img = NSImage(systemSymbolName: "lightbulb.fill", accessibilityDescription: nil)
    var smallText = NSTextView(frame: NSRect(x: 800, y: 50, width: 400, height: 400))
    let attatch = NSTextAttachment()
    var attString = NSAttributedString()
    var config = NSImage.SymbolConfiguration(textStyle: .title2, scale: .small)
    
    var storage = NSTextStorage()
    var layoutManage = NSLayoutManager()
    var container = NSTextContainer()
    
    let attr = NSAttributedString(string: "Hello", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 18, weight: .semibold)])
    

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    override func layout() {
        super.layout()
        self.wantsLayer = true
//        self.layer?.borderWidth = 2
//        self.layer?.borderColor = .white
//        self.layer?.backgroundColor = .clear
//        self.backgroundColor = NSColor.white
        self.textColor = .white
        self.drawsBackground = false
        self.delegate = self
        self.toolTip = "Text View"
//////        self.selectedRange = NSMakeRange(3, 8)
//////        self.textContainer = NSTextContainer(size: NSSize(width: 350, height: 350))
        self.insertionPointColor = NSColor.red
//        self.maxSize.height = 150
        self.layer?.cornerRadius = 10
        self.alignment = .justified
//        self.drawInsertionPoint(in: self.bounds, color: NSColor.red, turnedOn: true)
        
        textField.wantsLayer = true
        textField.layer?.backgroundColor = .clear
        textField.textColor = .systemMint
        textField.isEditable = false
        textField.stringValue = self.string
        textField.layer?.cornerRadius = 10
        textField.lineBreakMode = .byWordWrapping
        textField.wantsLayer = true
        textField.layer?.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
        textField.layer?.borderWidth = 3
        
//        scrollView.documentView = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.verticalScrollElasticity = .none
//        scrollView.horizontalScrollElasticity = .none
        scrollView.drawsBackground = false
        scrollView.wantsLayer = true
        scrollView.borderType = .bezelBorder
        scrollView.layer?.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
        scrollView.layer?.borderWidth = 3
        scrollView.layer?.cornerRadius = 10
        scrollView.hasVerticalScroller = true
//        scrollView.hasVerticalRuler = true
//        scrollView.rulersVisible = true
        scrollView.autohidesScrollers = false
        scrollView.scrollerStyle = .overlay
        scrollView.scrollerKnobStyle = .light
        scrollView.contentInsets = NSEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
//        scrollView.scrollerStyle = NSEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//
//        storage.addLayoutManager(layoutManage)
//        layoutManage.addTextContainer(container)
//
//        storage.setAttributedString(attString)
        
//        smallText.textContainer 
        smallText.textContainer?.size = NSSize(width: 140, height: 140)
        smallText.textContainer?.textView?.backgroundColor = .cyan
        smallText.textContainer?.textView?.textColor = .cyan
        smallText.textStorage?.setAttributedString(attString)
        smallText.backgroundColor = .white
        smallText.textColor = .black
        
        config = config.applying(.init(paletteColors: [.purple]))
        attatch.image = img?.withSymbolConfiguration(config)
//        attatch.image = img
        attString = NSAttributedString(attachment: attatch)
        
//        container.size = smallText.bounds.size
        
        
        
    }
    
//    override func drawBackground(in rect: NSRect) {
//        let rects = self.bounds
//        NSColor.blue.setFill()
//        NSBezierPath(rect: rects).fill()
//        backgroundColor = NSColor.blue
//    }
    
//    func textView(_ textView: NSTextView, willDisplayToolTip tooltip: String, forCharacterAt characterIndex: Int) -> String? {
//        tooltip
//    }
    override var intrinsicContentSize: NSSize {
        NSSize(width: 100, height: 50)
    }
    
    func textDidChange(_ notification: Notification) {
//        print(self.string)
        textField.stringValue = self.string
        let color = CGColor.init(red: .random(in: 0.4...1), green: .random(in: 0.4...1), blue: .random(in: 0.4...1), alpha: .random(in: 0.8...1))
        textField.textColor = NSColor(cgColor: color)
        textField.layer?.borderColor = color
        scrollView.layer?.borderColor = color
    }
    
    func textView(_ textView: NSTextView, shouldChangeTextIn affectedCharRange: NSRange, replacementString: String?) -> Bool {
        return true
    }
}
