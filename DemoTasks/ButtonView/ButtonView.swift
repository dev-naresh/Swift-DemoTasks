//
//  ButtonView.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 24/02/23.
//

import Cocoa

class ButtonView: NSView {
    
    @objc func themeChange(button : NSButton) {
        var config = NSImage.SymbolConfiguration()
        
        let toggle = {
            if self.toggleButton.state == .on {
                self.layer?.backgroundColor = .white
                self.toggleButton.layer?.backgroundColor = .black
                config = config.applying(.init(paletteColors: [.white]))
                self.toggleButton.image = self.toggleButton.image?.withSymbolConfiguration(config)
            } else if self.toggleButton.state == .off {
                self.layer?.backgroundColor = .black
                self.toggleButton.layer?.backgroundColor = .white
                config = config.applying(.init(paletteColors: [.black]))
                self.toggleButton.image = self.toggleButton.image?.withSymbolConfiguration(config)
            }
        }
        
        let momentary = {
            if self.momentaryButton.state == .on {
                self.layer?.backgroundColor = .white
                self.momentaryButton.layer?.backgroundColor = .black
                config = config.applying(.init(paletteColors: [.white]))
                self.momentaryButton.image = self.momentaryButton.image?.withSymbolConfiguration(config)
                config = config.applying(.init(paletteColors: [.white]))
                self.momentaryButton.alternateImage = self.momentaryButton.image?.withSymbolConfiguration(config)
                self.momentaryButton.attributedTitle = NSAttributedString(string: "Click", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
                self.momentaryButton.attributedAlternateTitle = NSAttributedString(string: "Release", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
                self.toggleButton.state = .on
                toggle()
            } else if self.momentaryButton.state == .off {
                self.layer?.backgroundColor = .black
                self.momentaryButton.layer?.backgroundColor = .white
                config = config.applying(.init(paletteColors: [.black]))
                self.momentaryButton.image = self.momentaryButton.image?.withSymbolConfiguration(config)
                config = config.applying(.init(paletteColors: [.black]))
                self.momentaryButton.alternateImage = self.momentaryButton.image?.withSymbolConfiguration(config)
                self.momentaryButton.attributedTitle = NSAttributedString(string: "Click", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
                self.momentaryButton.attributedAlternateTitle = NSAttributedString(string: "Release", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
                self.toggleButton.state = .off
                toggle()
            }
        }
        
        switch button.title {
        case "Light": toggle()
        case "Click": momentary()
        default: print("default")
        }
    }
    
    @objc func accel() {
        var config = NSImage.SymbolConfiguration()
        
        if self.accButton.integerValue == 1 {
            self.layer?.backgroundColor = .white
            self.accButton.layer?.backgroundColor = .black
            config = config.applying(.init(paletteColors: [.white]))
            self.accButton.image = self.accButton.image?.withSymbolConfiguration(config)
            self.accButton.attributedTitle = NSAttributedString(string: "Click", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
        }
        else if self.accButton.integerValue == 0 {
            self.layer?.backgroundColor = .black
            self.accButton.layer?.backgroundColor = .white
            config = config.applying(.init(paletteColors: [.black]))
            self.accButton.image = self.accButton.image?.withSymbolConfiguration(config)
            self.accButton.attributedTitle = NSAttributedString(string: "Click", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
        }
    }
    
    @objc func multiAcc() {
        var config = NSImage.SymbolConfiguration()
        
//        print(self.multiAccButton.integerValue)
        
        switch self.multiAccButton.integerValue {
        case 0:
            self.layer?.backgroundColor = .init(gray: 0.0, alpha: 1)
            self.multiAccButton.layer?.backgroundColor = .init(gray: 1.0, alpha: 1)
            config = config.applying(.init(paletteColors: [.black]))
            self.multiAccButton.image = self.multiAccButton.image?.withSymbolConfiguration(config)
            self.multiAccButton.attributedTitle = NSAttributedString(string: "Click", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
        case 1:
            self.layer?.backgroundColor = .init(gray: 0.2, alpha: 1)
            self.multiAccButton.layer?.backgroundColor = .init(gray: 0.9, alpha: 1)
            config = config.applying(.init(paletteColors: [.black]))
            self.multiAccButton.image = self.multiAccButton.image?.withSymbolConfiguration(config)
            self.multiAccButton.attributedTitle = NSAttributedString(string: "Click", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
        case 2:
            self.layer?.backgroundColor = .init(gray: 0.4, alpha: 1)
            self.multiAccButton.layer?.backgroundColor = .init(gray: 0.8, alpha: 1)
            config = config.applying(.init(paletteColors: [.black]))
            self.multiAccButton.image = self.multiAccButton.image?.withSymbolConfiguration(config)
            self.multiAccButton.attributedTitle = NSAttributedString(string: "Click", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
        case 3:
            self.layer?.backgroundColor = .init(gray: 0.6, alpha: 1)
            self.multiAccButton.layer?.backgroundColor = .init(gray: 0.2, alpha: 1)
            config = config.applying(.init(paletteColors: [.white]))
            self.multiAccButton.image = self.multiAccButton.image?.withSymbolConfiguration(config)
            self.multiAccButton.attributedTitle = NSAttributedString(string: "Click", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
        case 4:
            self.layer?.backgroundColor = .init(gray: 0.8, alpha: 1)
            self.multiAccButton.layer?.backgroundColor = .init(gray: 0.1, alpha: 1)
            config = config.applying(.init(paletteColors: [.white]))
            self.multiAccButton.image = self.multiAccButton.image?.withSymbolConfiguration(config)
            self.multiAccButton.attributedTitle = NSAttributedString(string: "Click", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
        case 5:
            self.layer?.backgroundColor = .init(gray: 1.0, alpha: 1)
            self.multiAccButton.layer?.backgroundColor = .init(gray: 0.0, alpha: 1)
            config = config.applying(.init(paletteColors: [.white]))
            self.multiAccButton.image = self.multiAccButton.image?.withSymbolConfiguration(config)
            self.multiAccButton.attributedTitle = NSAttributedString(string: "Click", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
        default: print("No case")
        }
    }
    
    @objc func checkToggle() {
        if self.checkBox.state == .on {
//            print("on")
        }
        else if self.checkBox.state == .off {
//            print("off")
        }
    }
    
    @objc func radioToggle(button : NSButton) {
        if button.title == radioButton.title {
            self.radioButton2.state = .off
        }
        else if button.title == radioButton2.title {
            self.radioButton.state = .off
        }
    }

    var button: NSButton = {
        let btn = NSButton(frame: NSRect(x: 100, y: 100, width: 100, height: 35))
        let btnImg = NSImage(systemSymbolName: "paperclip", accessibilityDescription: nil)
        var attr = NSAttributedString(string: "Paperclip", attributes: [NSAttributedString.Key.foregroundColor: NSColor.purple, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .bold)])
        var config = NSImage.SymbolConfiguration(textStyle: .title2, scale: .small)
        
        btn.wantsLayer = true
        btn.bezelStyle = .inline
//        btn.showsBorderOnlyWhileMouseInside = true
        btn.isBordered = false
        btn.layer?.backgroundColor = .clear
        btn.layer?.cornerRadius = btn.bounds.height / 2
        btnImg?.size = NSSize(width: 30, height: 30)
        btn.image = btnImg
        btnImg?.backgroundColor = .green
//        btn.title = "paperclip"
        btn.attributedTitle = attr
        btn.imagePosition = .imageLeading
        btn.imageHugsTitle = true
        btn.image?.resizingMode = .stretch
        config = config.applying(.init(paletteColors: [.purple]))
        btn.image = btnImg?.withSymbolConfiguration(config)
        return btn
    }()
    
    var toggleButton: NSButton = {
        let btn = NSButton(frame: NSRect(x: 100, y: 200, width: 100, height: 35))
        let attr = NSAttributedString(string: "Light", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
        let altAttr = NSAttributedString(string: "Dark", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
        var config = NSImage.SymbolConfiguration(textStyle: .title2, scale: .small)
        let btnImg = NSImage(systemSymbolName: "sun.max", accessibilityDescription: nil)
        let altBtnImg = NSImage(systemSymbolName: "moon", accessibilityDescription: nil)
        
        btn.wantsLayer = true
        btn.bezelStyle = .texturedRounded
        btn.setButtonType(.toggle)
        btn.layer?.backgroundColor = .white
        btn.layer?.cornerRadius = btn.bounds.height / 2
        btn.attributedTitle = attr
        btn.attributedAlternateTitle = altAttr
        btn.image = btnImg
        btn.alternateImage = altBtnImg
        btn.imagePosition = .imageLeading
        btn.imageHugsTitle = true
        config = config.applying(.init(paletteColors: [.black]))
        btn.image = btnImg?.withSymbolConfiguration(config)
        config = config.applying(.init(paletteColors: [.white]))
        btn.alternateImage = altBtnImg?.withSymbolConfiguration(config)
        
        
        return btn
    }()
    
    var momentaryButton: NSButton = {
        let btn = NSButton(frame: NSRect(x: 100, y: 300, width: 100, height: 35))
        let attr = NSAttributedString(string: "Click", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
        let altAttr = NSAttributedString(string: "Release", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
        var config = NSImage.SymbolConfiguration(textStyle: .title2, scale: .small)
        let btnImg = NSImage(systemSymbolName: "hand.point.up", accessibilityDescription: nil)
        let altBtnImg = NSImage(systemSymbolName: "hand.point.up.braille.fill", accessibilityDescription: nil)
        
        btn.wantsLayer = true
        btn.bezelStyle = .texturedRounded
        btn.setButtonType(.momentaryChange)
        btn.layer?.backgroundColor = .white
        btn.layer?.cornerRadius = btn.bounds.height / 2
        btn.attributedTitle = attr
        btn.attributedAlternateTitle = altAttr
        btn.image = btnImg
        btn.alternateImage = altBtnImg
        btn.imagePosition = .imageLeading
        btn.imageHugsTitle = true
        config = config.applying(.init(paletteColors: [.black]))
        btn.image = btnImg?.withSymbolConfiguration(config)
        config = config.applying(.init(paletteColors: [.black]))
        btn.alternateImage = altBtnImg?.withSymbolConfiguration(config)
        return btn
    }()
    
    var accButton: NSButton = {
        let btn = NSButton(frame: NSRect(x: 100, y: 400, width: 100, height: 35))
        let attr = NSAttributedString(string: "Click", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
        var config = NSImage.SymbolConfiguration(textStyle: .title2, scale: .small)
        let btnImg = NSImage(systemSymbolName: "hand.point.up", accessibilityDescription: nil)
        
        btn.wantsLayer = true
        btn.bezelStyle = .texturedRounded
        btn.setButtonType(.accelerator)
        btn.layer?.backgroundColor = .white
        btn.layer?.cornerRadius = btn.bounds.height / 2
        btn.attributedTitle = attr
        btn.image = btnImg
        btn.imagePosition = .imageLeading
        btn.imageHugsTitle = true
        config = config.applying(.init(paletteColors: [.black]))
        btn.image = btnImg?.withSymbolConfiguration(config)
        return btn
    }()
    
    var multiAccButton: NSButton = {
        let btn = NSButton(frame: NSRect(x: 100, y: 500, width: 100, height: 35))
        let attr = NSAttributedString(string: "Click", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
        var config = NSImage.SymbolConfiguration(textStyle: .title2, scale: .small)
        let btnImg = NSImage(systemSymbolName: "hand.point.up", accessibilityDescription: nil)
        
        btn.wantsLayer = true
        btn.bezelStyle = .inline
        btn.setButtonType(.multiLevelAccelerator)
        btn.maxAcceleratorLevel = 5
        btn.layer?.backgroundColor = .white
        btn.layer?.cornerRadius = btn.bounds.height / 2
        btn.attributedTitle = attr
        btn.image = btnImg
        btn.imagePosition = .imageLeading
        btn.imageHugsTitle = true
        config = config.applying(.init(paletteColors: [.black]))
        btn.image = btnImg?.withSymbolConfiguration(config)
        return btn
    }()
    
    var checkBox: NSButton = {
        let btn = NSButton(frame: NSRect(x: 100, y: 600, width: 100, height: 35))
        let attr = NSAttributedString(string: " I agree the terms and conditions.", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
        var config = NSImage.SymbolConfiguration(textStyle: .title2, scale: .medium)
        let btnImg = NSImage(systemSymbolName: "circle", accessibilityDescription: nil)
        let altImg = NSImage(systemSymbolName: "checkmark.circle", accessibilityDescription: nil)
        
        btn.wantsLayer = true
        btn.setButtonType(.switch)
//        btn.image = btnImg
//        btn.alternateImage = altImg
//        btn.stringValue = "Accept"
        btn.alignment = .center
        btn.attributedTitle = NSAttributedString(string: " I agree", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 15, weight: .semibold)])
//        btn.state = .off
        btn.imagePosition = .imageLeading
        btn.imageHugsTitle = true
        config = config.applying(.init(paletteColors: [.white]))
        btn.image = btnImg?.withSymbolConfiguration(config)
        config = config.applying(.init(paletteColors: [.white]))
        btn.alternateImage = altImg?.withSymbolConfiguration(config)
        return btn
    }()
    
    var radioButton: NSButton = {
        let btn = NSButton(frame: NSRect(x: 100, y: 700, width: 100, height: 35))
        let attr = NSAttributedString(string: " I agree the terms and conditions.", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
        var config = NSImage.SymbolConfiguration(textStyle: .title2, scale: .medium)
        let btnImg = NSImage(systemSymbolName: "circle", accessibilityDescription: nil)
        let altImg = NSImage(systemSymbolName: "largecircle.fill.circle", accessibilityDescription: nil)
        
//        btn.wantsLayer = true
        btn.setButtonType(.radio)
//        btn.stringValue = "Accept"
        btn.alignment = .center
        btn.attributedTitle = NSAttributedString(string: " No", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 15, weight: .semibold)])
//        btn.state = .on
        btn.imagePosition = .imageLeading
        btn.imageHugsTitle = true
        config = config.applying(.init(paletteColors: [.white]))
        btn.image = btnImg?.withSymbolConfiguration(config)
        config = config.applying(.init(paletteColors: [.white]))
        btn.alternateImage = altImg?.withSymbolConfiguration(config)
        return btn
    }()
    
    var radioButton2: NSButton = {
        let btn = NSButton(frame: NSRect(x: 100, y: 740, width: 100, height: 35))
        let attr = NSAttributedString(string: " I agree the terms and conditions.", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 12, weight: .semibold)])
        var config = NSImage.SymbolConfiguration(textStyle: .title2, scale: .medium)
        let btnImg = NSImage(systemSymbolName: "circle", accessibilityDescription: nil)
        let altImg = NSImage(systemSymbolName: "largecircle.fill.circle", accessibilityDescription: nil)
        
//        btn.wantsLayer = true
        btn.setButtonType(.radio)
        btn.alignment = .center
        btn.attributedTitle = NSAttributedString(string: " Yes", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 15, weight: .semibold)])
//        btn.state = .off
        btn.imagePosition = .imageLeading
        btn.imageHugsTitle = true
        config = config.applying(.init(paletteColors: [.white]))
        btn.image = btnImg?.withSymbolConfiguration(config)
        config = config.applying(.init(paletteColors: [.white]))
        btn.alternateImage = altImg?.withSymbolConfiguration(config)
        return btn
    }()
    
    var radio = {
        var btn = NSButton(frame: NSRect(x: 100, y: 700, width: 100, height: 35))
        btn.bezelStyle = .rounded
        btn.title = "d1"
        btn.setButtonType(.radio)
        return btn
    }()
    
    var radio2 = {
        var btn = NSButton(frame: NSRect(x: 100, y: 740, width: 100, height: 35))
        btn.bezelStyle = .rounded
        btn.title = "d2"
        btn.setButtonType(.radio)
        return btn
    }()
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    override func layout() {
        toggleButton.action = #selector(self.themeChange)
        toggleButton.target = self
        
        momentaryButton.action = #selector(self.themeChange)
        momentaryButton.target = self
        
        accButton.action = #selector(self.accel)
        accButton.target = self
        
        multiAccButton.action = #selector(self.multiAcc)
        multiAccButton.target = self
        
        checkBox.action = #selector(self.checkToggle)
        checkBox.target = self
        
        radioButton.action = #selector(self.radioToggle)
        radioButton.target = self
        
        radioButton2.action = #selector(self.radioToggle)
        radioButton2.target = self
        
        radio.action = #selector(self.radioToggle)
        radio.target = self
        
        radio2.action = #selector(self.radioToggle)
        radio2.target = self
        
        self.addSubview(button)
        self.addSubview(toggleButton)
        self.addSubview(momentaryButton)
        self.addSubview(accButton)
        self.addSubview(multiAccButton)
        self.addSubview(checkBox)
        self.addSubview(radioButton)
        self.addSubview(radioButton2)
//        self.addSubview(radio)
//        self.addSubview(radio2)
        super.layout()
    }
    
}
