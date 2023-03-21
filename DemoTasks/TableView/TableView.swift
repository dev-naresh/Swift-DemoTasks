//
//  TableView.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 15/03/23.
//

import Cocoa

class TableView: NSView, NSTableViewDataSource, NSTableViewDelegate {
    var userController: UserController?
    var previousView: Int?
    var rows = 0
    
    let cellGradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [CGColor.init(gray: 0.6, alpha: 0.45), CGColor.init(gray: 0.35, alpha: 0.35)]
        gradient.startPoint = CGPoint(x: 0, y: 0.1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.locations = [0, 1]
        gradient.borderWidth = 2
        gradient.borderColor = .init(gray: 0.2, alpha: 0.5)
        return gradient
    }()
    
    let selectedCellGradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [CGColor.init(gray: 1, alpha: 0.9), CGColor.init(gray: 1, alpha: 0.7)]
        gradient.startPoint = CGPoint(x: 0, y: 0.1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.locations = [0, 1]
        gradient.borderWidth = 2
        gradient.borderColor = .init(gray: 0, alpha: 1)
        return gradient
    }()
    
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
    
    var mainTableView: NSTableView = {
        var view = NSTableView()
        var column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("Column"))
        view.backgroundColor = .black
        view.intercellSpacing = NSSize(width: 100, height: 5)
        view.style = .fullWidth
        view.selectionHighlightStyle = .regular
        column.title = "Color"
        view.addTableColumn(column)
        view.headerView = nil
    
        return view
    }()

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        if let row = userController?.user.count {
            rows = row + 1
        }
        return rows
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if row == 0 {
            var view = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue:"Label"), owner: self) as? CustomLabelView
            if view == nil {
                view = CustomLabelView(frame: NSRect(x: 0, y: 0, width: 300, height: 100))
                view?.identifier =  NSUserInterfaceItemIdentifier(rawValue: "Label")
                view?.refreshBtn.action = #selector(refreshData)
            }
            return view
        }

        if let user = userController?.user[row - 1] {
            let identifier =  NSUserInterfaceItemIdentifier(rawValue: "Cell")
            let view  = createView(tableView, identifier) as? CustomCellView
            var completed = 0
            var pending = 0
            
            user.todos.map{($0.status == "completed") ? (completed += 1) : (pending += 1)}
            
            view?.profileImage.image = NSImage(contentsOfFile: "/Users/naresh-pt6259/Downloads/Image/\(user.name).jpg")
            
            if row != tableView.selectedRow {
                view?.userName.attributedStringValue = NSMutableAttributedString(string: "\(user.name)", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 18, weight: .semibold)])
                view?.completedView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: "\(completed)", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
                view?.pendingView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: "\(pending)", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
            }
            
            if row == tableView.selectedRow {
                view?.userName.attributedStringValue = NSMutableAttributedString(string: user.name, attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 18, weight: .semibold)])
                view?.completedView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: "\(completed)", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
                view?.pendingView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: "\(pending)", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
            }
                
            return view
        }
        
        return nil
    }
    
    func createView(_ tableView : NSTableView , _ identifier : NSUserInterfaceItemIdentifier) -> NSView?
    {
       var view = tableView.makeView(withIdentifier: identifier, owner: self) as? CustomCellView
        if view == nil {
            view = CustomCellView(frame: NSRect(x: 0, y: 0, width: 300, height: 30))
            view?.identifier =  identifier
        } else {
            print("Reused")
        }
        return view
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        if row == 0 {
            return 50
        } else {
            return 100
        }
    }
    
    func tableView(_ tableView: NSTableView, isGroupRow row: Int) -> Bool {
        if row == 0 {
            return true
        } else {
            return false
        }
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        if row == 0 {
            return false
        }
        return true
    }
    
    func tableViewSelectionIsChanging (_ notification: Notification) {
        let tableView = notification.object as? NSTableView
        guard let cell = tableView!.view(atColumn: 0, row: tableView!.selectedRow, makeIfNecessary: false) as? CustomCellView else { return }
    
        cell.userName.attributedStringValue = NSMutableAttributedString(string: cell.userName.stringValue, attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 18, weight: .semibold)])
        cell.completedView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: cell.completedView.noOfEntries.stringValue, attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
        cell.pendingView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: cell.pendingView.noOfEntries.stringValue, attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])

        if let pView = previousView {
            guard let previousCell = tableView!.view(atColumn: 0, row: pView, makeIfNecessary: false) as? CustomCellView else { return }
            previousCell.userName.attributedStringValue = NSMutableAttributedString(string: previousCell.userName.stringValue, attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 18, weight: .semibold)])
            previousCell.completedView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: previousCell.completedView.noOfEntries.stringValue, attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
            previousCell.pendingView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: previousCell.pendingView.noOfEntries.stringValue, attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
        }
        
        previousView = tableView!.selectedRow
        
    }
   
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        return CustomTableRowView()
    }
    
    @objc func refreshData() {
        DispatchQueue.global(qos: .background).async {
            self.userController?.getUsers()
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                self.mainTableView.reloadData()
            }
        }
    }
    
}

class CustomLabelView : NSView{
    let cellGradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [CGColor.init(gray: 1, alpha: 0.9), CGColor.init(gray: 1, alpha: 0.7)]
        gradient.startPoint = CGPoint(x: 0, y: 0.1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.locations = [0, 1]
        gradient.borderWidth = 2
        gradient.borderColor = .init(gray: 0, alpha: 1)
        return gradient
    }()
    
    let label: NSTextField = {
        let label =  NSTextField(labelWithAttributedString: NSAttributedString(string: "To-Do Users", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 20, weight: .bold)]))
        return label
    }()
    
    let refreshBtn: NSButton = {
        let button = NSButton()
        let btnImg = NSImage(systemSymbolName: "arrow.triangle.2.circlepath", accessibilityDescription: nil)
        var config = NSImage.SymbolConfiguration(textStyle: .title2, scale: .medium)
        
        config = config.applying(.init(paletteColors: [.black]))
        button.image = btnImg?.withSymbolConfiguration(config)
        button.imagePosition = .imageOnly
        button.isBordered = false
        button.toolTip = "Refresh"
        
        return button
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer = cellGradient
        self.layer?.cornerRadius = 10
        
        self.addSubviewAndConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviewAndConstraint() {
        label.translatesAutoresizingMaskIntoConstraints = false
        refreshBtn.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        addSubview(refreshBtn)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 25),
            label.widthAnchor.constraint(equalToConstant: 200),
            
            refreshBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            refreshBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            refreshBtn.heightAnchor.constraint(equalToConstant: 30),
            refreshBtn.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
}

class CustomCellView: NSTableCellView {
    let completedView = CustomStatusView()
    let pendingView = CustomStatusView()
    var userNameString = NSMutableAttributedString(string: "")
    
    let cellGradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [CGColor.init(gray: 0.6, alpha: 0.45), CGColor.init(gray: 0.35, alpha: 0.35)]
        gradient.startPoint = CGPoint(x: 0, y: 0.1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.locations = [0, 1]
        gradient.borderWidth = 2
        gradient.borderColor = .init(gray: 0.2, alpha: 0.5)
        return gradient
    }()
    
    let profileImage: NSImageView = {
        let imageView = NSImageView()
        imageView.wantsLayer = true
        imageView.frame = NSRect(x: 10, y: 20, width: 60, height: 60)
        imageView.layer?.cornerRadius = imageView.bounds.height / 2
        imageView.layer?.borderColor = .init(gray: 0, alpha: 0.7)
        imageView.layer?.borderWidth = 1.5
        imageView.imageScaling = .scaleAxesIndependently
        return imageView
    }()
    
    let userName: NSTextField = {
        let textField = NSTextField(labelWithAttributedString: NSMutableAttributedString(string: ""))
        textField.frame = NSRect(x: 90, y: 50, width: 250, height: 25)
        return textField
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer = cellGradient
        self.layer?.cornerRadius = 10
        
        userName.attributedStringValue = userNameString

        var img = NSImage(systemSymbolName: "checkmark.circle", accessibilityDescription: nil)
        var config = NSImage.SymbolConfiguration(textStyle: .title2, scale: .medium)
        
        config = config.applying(.init(paletteColors: [.green]))
        completedView.statusImage.image = img?.withSymbolConfiguration(config)
        
        img = NSImage(systemSymbolName: "circle.fill", accessibilityDescription: nil)
        
        config = config.applying(.init(paletteColors: [.orange]))
        pendingView.statusImage.image = img?.withSymbolConfiguration(config)
        
        self.addSubviewAndConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviewAndConstraint() {
        userName.translatesAutoresizingMaskIntoConstraints = false
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        completedView.translatesAutoresizingMaskIntoConstraints = false
        pendingView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(userName)
        self.addSubview(profileImage)
        self.addSubview(completedView)
        self.addSubview(pendingView)
        
        NSLayoutConstraint.activate([
            profileImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            profileImage.widthAnchor.constraint(equalToConstant: 60),
            profileImage.heightAnchor.constraint(equalToConstant: 60),

            userName.topAnchor.constraint(equalTo: profileImage.topAnchor),
            userName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 30),
            userName.widthAnchor.constraint(equalToConstant: 250),
            userName.heightAnchor.constraint(equalToConstant: 25),
            
            completedView.bottomAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 5),
            completedView.leadingAnchor.constraint(equalTo: userName.leadingAnchor, constant: -5),
            completedView.widthAnchor.constraint(equalToConstant: 100),
            completedView.heightAnchor.constraint(equalToConstant: 25),
            
            pendingView.bottomAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 5),
            pendingView.trailingAnchor.constraint(equalTo: userName.trailingAnchor, constant: 5),
            pendingView.widthAnchor.constraint(equalToConstant: 100),
            pendingView.heightAnchor.constraint(equalToConstant: 25),
        ])
    }
    
    override func prepareForReuse() {
        userName.stringValue = ""
        profileImage.image = nil
    }
}

class CustomStatusView: NSView {
    var statusImage = NSImageView()
    let noOfEntries = NSTextField(labelWithAttributedString: NSAttributedString(string: "0"))
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.addSubviewAndConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviewAndConstraint() {
        statusImage.translatesAutoresizingMaskIntoConstraints = false
        noOfEntries.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(noOfEntries)
        self.addSubview(statusImage)
        
        NSLayoutConstraint.activate([
            statusImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            statusImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            statusImage.widthAnchor.constraint(equalToConstant: 30),
            statusImage.heightAnchor.constraint(equalToConstant: 30),

            noOfEntries.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            noOfEntries.leadingAnchor.constraint(equalTo: statusImage.trailingAnchor, constant: 10),
            noOfEntries.widthAnchor.constraint(equalToConstant: 50),
            noOfEntries.heightAnchor.constraint(equalToConstant: 17),
        ])
    }
}

class CustomTableRowView: NSTableRowView {
    override func drawBackground(in dirtyRect: NSRect) {
        if isGroupRowStyle {
            return
        }
        super.drawBackground(in: dirtyRect)
    }
    
    override func drawSelection(in dirtyRect: NSRect) {
        if self.selectionHighlightStyle != .none {
            let selectionRect = NSInsetRect(self.bounds, 7.0, 3.5)
            NSColor(calibratedWhite: 0.65, alpha: 1).setStroke()
            NSColor(calibratedWhite: 0.82, alpha: 1).setFill()
            let selectionPath = NSBezierPath.init(roundedRect: selectionRect, xRadius: 10, yRadius: 10)
            selectionPath.fill()
            selectionPath.stroke()
        }
    }
}

