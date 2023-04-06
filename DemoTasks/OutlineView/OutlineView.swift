//
//  OutlineView.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 30/03/23.
//

import Cocoa

class OutlineView: NSView, NSOutlineViewDataSource, NSOutlineViewDelegate {
    var userController: UserController? = UserController()
    var downloadImage = DownloadImage()
    var images = [String: NSImage]()
    var previousView: Int?
    var tableCellView: CustomCellView?
    let paraStyle = NSMutableParagraphStyle()
    var highlightedRow: CustomCellView?
    var flag = 0
    
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
    
    var mainOutlineView: NSOutlineView = {
        var view = NSOutlineView()
        var column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("Column"))
        view.intercellSpacing = NSSize(width: 100, height: 10)
        view.backgroundColor = .black
        view.style = .fullWidth
        view.selectionHighlightStyle = .regular
        view.addTableColumn(column)
        view.headerView = nil
        view.usesAutomaticRowHeights = true
        view.indentationPerLevel = 0
    
        return view
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        userController?.getUsers()
        paraStyle.alignment = .justified
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if let item = item as? UserModel.User {
            return item.todos.count
        } else if userController?.record?.users.count != nil {
            return userController!.record!.users.count + 1
        } else {
            return 1
        }
    }

    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let item = item as? UserModel.User {
            let userIndex = userController?.user.firstIndex(where: {item in return true})
            return userController?.user[userIndex!].todos[index]
        } else if (userController?.record?.users.count) != nil {
            return index == 0 ? "": userController?.record!.users[index - 1]
        }else{
            return ""
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        if item is String {
            return false
        }
        if item is UserModel.ToDo {
            return false
        }
        return true
    }
    
    func outlineView(_ outlineView: NSOutlineView, rowViewForItem item: Any) -> NSTableRowView? {
        return CustomTableRowView()
    }

    func outlineView(_ outlineView: NSOutlineView, heightOfRowByItem item: Any) -> CGFloat {
        return 100
    }

    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        
        let row = outlineView.row(forItem: item)
        if let item = item as? String{
//            print("Entered: 1")
            var view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue:"Label"), owner: self) as? CustomLabelView
            if view == nil {
                view = CustomLabelView(frame: NSRect(x: 0, y: 0, width: 300, height: 100))
                view?.identifier =  NSUserInterfaceItemIdentifier(rawValue: "Label")
                view?.refreshBtn.action = #selector(refreshData)
            }
            return view
        }
        
        if let item = item as? UserModel.User {
//            print("Entered: 2")
                let identifier =  NSUserInterfaceItemIdentifier(rawValue: "Cell")
                tableCellView  = createView(outlineView, identifier) as? CustomCellView
                var completed = 0
                var pending = 0
                
                item.todos.map{($0.status == "completed") ? (completed += 1) : (pending += 1)}
                tableCellView?.source = item
                
                tableCellView?.profileImage.image = NSImage(contentsOfFile: "/Users/naresh-pt6259/Downloads/Image/\(item.name).jpg")
                if let image = images[item.name]{
                    tableCellView?.profileImage.image = image
                } else {
                    self.downloadImage.downloader(item.url, "Image/\(item.name).jpg") {
                        image, resUrl in
                        DispatchQueue.main.async {
                            if resUrl == URL(string: (self.tableCellView?.source?.url)!) {
                                self.tableCellView?.profileImage.image = image
                            } else {
                                self.tableCellView?.profileImage.image = NSImage(systemSymbolName: "person.fill", accessibilityDescription: nil)
                            }
                        }
                    }
                }
                
            if row != outlineView.selectedRow {
                    tableCellView?.userName.attributedStringValue = NSMutableAttributedString(string: "\(item.name)", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 18, weight: .semibold)])
                    tableCellView?.completedView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: "\(completed)", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
                    tableCellView?.pendingView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: "\(pending)", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
                    tableCellView?.about.attributedStringValue = NSMutableAttributedString(string: item.description, attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.paragraphStyle: paraStyle])
                }
                
                if row == outlineView.selectedRow {
                    tableCellView?.userName.attributedStringValue = NSMutableAttributedString(string: item.name, attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 18, weight: .semibold)])
                    tableCellView?.completedView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: "\(completed)", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
                    tableCellView?.pendingView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: "\(pending)", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
                    tableCellView?.about.attributedStringValue = NSMutableAttributedString(string: item.description, attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.paragraphStyle: paraStyle])
                }
                
                return tableCellView
        }
        
        if let item = item as? UserModel.ToDo {
            print("Entered: 3")
            var image = NSImage()
            var config = NSImage.SymbolConfiguration(textStyle: .headline, scale: .large)

            let customView = createView(outlineView, NSUserInterfaceItemIdentifier(rawValue: "Status")) as? CustomTodoView
            customView?.wantsLayer = true
            customView?.refreshBtn.action = #selector(refreshTodoData)
            customView?.label.attributedStringValue = NSMutableAttributedString(string: item.description, attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
            print(item.status, userController!.user[0].todos[0] === item)
            if item.status == "completed" {
                config = config.applying(.init(paletteColors: [.systemGreen]))
                image = NSImage(systemSymbolName: "checkmark.circle", accessibilityDescription: nil)!
                customView?.statusImage.image = image.withSymbolConfiguration(config)
            } else {
                config = config.applying(.init(paletteColors: [.systemOrange]))
                image = NSImage(systemSymbolName: "clock.arrow.circlepath", accessibilityDescription: nil)!
                customView?.statusImage.image = image.withSymbolConfiguration(config)
            }
            return customView
        }

        return nil
    }

    func createView(_ tableView : NSOutlineView , _ identifier : NSUserInterfaceItemIdentifier) -> NSView? {
        if identifier.rawValue == "Cell" {
            var view = tableView.makeView(withIdentifier: identifier, owner: self) as? CustomCellView
            if view == nil {
                view = CustomCellView()
                view?.identifier =  identifier
            }
            return view
        } else if identifier.rawValue == "Status" {
            print("Status")
            var view = tableView.makeView(withIdentifier: identifier, owner: self) as? CustomTodoView
            if view == nil {
                view = CustomTodoView()
                view?.identifier =  identifier
            }
            return view
        }
        
        return nil
    }

    func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
        if item is String {
            return true
        } else {
            return false
        }
    }

    func outlineView(_ outlineView: NSOutlineView, shouldSelectItem item: Any) -> Bool {
        if item is String || item is UserModel.ToDo {
            return false
        }
        return true
    }

    func outlineViewSelectionIsChanging(_ notification: Notification) {
        let outlineView = notification.object as? NSOutlineView
        guard let cell = outlineView!.view(atColumn: 0, row: outlineView!.selectedRow, makeIfNecessary: false) as? CustomCellView else { return }

        cell.userName.attributedStringValue = NSMutableAttributedString(string: cell.userName.stringValue, attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 18, weight: .semibold)])
        cell.completedView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: cell.completedView.noOfEntries.stringValue, attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
        cell.pendingView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: cell.pendingView.noOfEntries.stringValue, attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
        cell.about.attributedStringValue = NSMutableAttributedString(string: cell.about.stringValue, attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.paragraphStyle: paraStyle])
//        outlineView?.expandItem(outlineView?.item(atRow: outlineView!.selectedRow))

        if let pView = previousView {
            guard let previousCell = outlineView!.view(atColumn: 0, row: pView, makeIfNecessary: false) as? CustomCellView else { return }
            previousCell.userName.attributedStringValue = NSMutableAttributedString(string: previousCell.userName.stringValue, attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 18, weight: .semibold)])
            previousCell.completedView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: previousCell.completedView.noOfEntries.stringValue, attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
            previousCell.pendingView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: previousCell.pendingView.noOfEntries.stringValue, attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
            previousCell.about.attributedStringValue = NSMutableAttributedString(string: previousCell.about.stringValue, attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.paragraphStyle: paraStyle])
            print(outlineView?.item(atRow: previousView!))
            outlineView?.collapseItem(outlineView?.item(atRow: previousView!))
        }
    }
    
    func outlineViewSelectionDidChange(_ notification: Notification) {
        let outlineView = notification.object as? NSOutlineView
        previousView = outlineView?.selectedRow
    }
    
    @objc func refreshData() {
        DispatchQueue.global(qos: .background).async {
            self.userController?.getUsers()
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500)) {
                self.mainOutlineView.reloadData()
            }
        }
    }
    
    @objc func refreshTodoData(_ item: NSButton) {
        var data = self.mainOutlineView.item(atRow: mainOutlineView.row(for: item.superview!))
        DispatchQueue.global(qos: .background).async {
            self.userController?.getUsers()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500)) {
                print(self.userController?.user[0].todos[0].status)
                print(self.userController!.user[0].todos[0] === data as! UserModel.ToDo)
                print(self.mainOutlineView.item(atRow: self.mainOutlineView.row(for: item.superview!)), self.userController?.user[0].todos[0].status)
                var rowIndex = self.mainOutlineView.row(forItem: data)
//                print(rowIndex)
//                self.mainOutlineView.reloadData(forRowIndexes: IndexSet(integer: 2), columnIndexes: IndexSet(integer: 0))
                self.mainOutlineView.reloadItem(self.mainOutlineView.parent(forItem: data), reloadChildren: true)
                self.mainOutlineView.reloadItem(self.mainOutlineView.parent(forItem: data))
            }
        }
    }
}

class CustomTodoView : NSView{
    let statusImage = NSImageView()
    
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
    
    let label: NSTextField = {
        let label =  NSTextField(labelWithAttributedString: NSAttributedString(string: "To-Do Users", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 18, weight: .bold)]))
        
        return label
    }()
    
    let refreshBtn: NSButton = {
        let button = NSButton()
        let btnImg = NSImage(systemSymbolName: "arrow.clockwise", accessibilityDescription: nil)
        var config = NSImage.SymbolConfiguration(textStyle: .headline, scale: .large)
        
        config = config.applying(.init(paletteColors: [.white]))
        button.image = btnImg?.withSymbolConfiguration(config)
        button.imagePosition = .imageOnly
        button.isBordered = false
        button.toolTip = "Reload Data"
        
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
        statusImage.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        refreshBtn.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(statusImage)
        addSubview(label)
        addSubview(refreshBtn)
        
        NSLayoutConstraint.activate([
            statusImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            statusImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            statusImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            statusImage.widthAnchor.constraint(equalToConstant: 30),
            statusImage.heightAnchor.constraint(equalToConstant: 30),
            
            label.centerYAnchor.constraint(equalTo: statusImage.centerYAnchor, constant: 3),
            label.leadingAnchor.constraint(equalTo: statusImage.trailingAnchor, constant: 15),
            label.heightAnchor.constraint(equalToConstant: 25),
            label.widthAnchor.constraint(equalToConstant: 200),
            
            refreshBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            refreshBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            refreshBtn.heightAnchor.constraint(equalToConstant: 30),
            refreshBtn.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
}
