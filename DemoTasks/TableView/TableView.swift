//
//  TableView.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 15/03/23.
//

import Cocoa

class TableView: NSView, NSTableViewDataSource, NSTableViewDelegate {
    var userController: UserController? = UserController()
    var downloadImage = DownloadImage()
    var images = [String: NSImage]()
    var previousView: Int?
    var tableCellView: CustomCellView?
    let paraStyle = NSMutableParagraphStyle()
    var highlightedRow: CustomCellView?
    
    let attributedString = ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", "Aenean non nisl sit amet quam vestibulum luctus. Morbi dignissim nisl id metus suscipit laoreet. Vivamus convallis mauris augue, sed malesuada sem fringilla non. Suspendisse molestie lectus enim. Donec pharetra velit porttitor, tristique ligula a, tempus lacus. Etiam sed lobortis diam. Praesent tempor tellus at sem lacinia faucibus.", "Proin id velit erat. Donec sagittis scelerisque metus at scelerisque. Aliquam aliquet quis augue eu maximus. Quisque rutrum sodales blandit. Mauris vel elit nulla. Nam pellentesque tincidunt ante, vel auctor felis cursus sed. Donec nec suscipit est.", "Integer maximus sapien risus, id viverra ex egestas non. Curabitur dignissim scelerisque consequat. Etiam sapien lectus, tristique eu consequat non, finibus in lorem. Cras vitae diam a orci iaculis auctor.", "Nunc efficitur, ligula sed gravida maximus, ex sem maximus magna, et convallis tellus sem nec odio. Donec semper nulla non felis euismod porttitor. Vivamus sodales faucibus est, sit amet suscipit eros. Sed at eros non mauris vehicula dapibus eu non metus. Nunc rutrum diam in justo tristique cursus.", "Morbi velit nulla, iaculis at erat nec, egestas mattis nulla. Aliquam eget volutpat felis. Sed vitae elit dignissim, pellentesque orci sit amet, accumsan ipsum. Donec bibendum eleifend purus, vel pellentesque dolor molestie quis. Quisque quam nibh, scelerisque facilisis lacus nec, auctor condimentum metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin, quam at imperdiet imperdiet, nunc turpis pretium risus, a molestie ligula ligula ac dui. Vestibulum non lorem dolor. Morbi id rutrum nibh.", "Morbi at eleifend metus. Nunc porta lacus id tortor gravida venenatis. Donec dictum magna orci, elementum ullamcorper nunc consectetur sit amet. Etiam non sapien dui. Curabitur cursus risus lacus, id sollicitudin mi vestibulum commodo. Nulla in vulputate ante, at pretium sapien. Aenean a elit eu tortor fermentum auctor. Quisque quis ex pellentesque, posuere libero eget, semper nunc. Donec maximus imperdiet velit, eu auctor augue molestie non. Proin nisi ipsum, congue eget nisi vitae, dignissim molestie mauris.", "Phasellus cursus aliquet iaculis. Curabitur dapibus lectus at arcu vulputate ultricies. Donec urna nibh, aliquam eu nisi in, feugiat mattis justo. Nulla facilisi. Cras lacinia felis lectus, vel euismod lorem auctor non. Aliquam ut cursus lorem. Ut sit amet arcu id ipsum volutpat eleifend.", "Quisque in finibus lectus, a consectetur ipsum. Nunc auctor suscipit mauris vel faucibus. Nam id urna sed orci tincidunt laoreet ac tincidunt augue. Integer rutrum, tortor quis venenatis rhoncus, sapien urna tincidunt leo, sed laoreet odio diam quis velit.", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", "Aenean non nisl sit amet quam vestibulum luctus. Morbi dignissim nisl id metus suscipit laoreet. Vivamus convallis mauris augue, sed malesuada sem fringilla non. Suspendisse molestie lectus enim. Donec pharetra velit porttitor, tristique ligula a, tempus lacus. Etiam sed lobortis diam. Praesent tempor tellus at sem lacinia faucibus.", "Proin id velit erat. Donec sagittis scelerisque metus at scelerisque. Aliquam aliquet quis augue eu maximus. Quisque rutrum sodales blandit. Mauris vel elit nulla. Nam pellentesque tincidunt ante, vel auctor felis cursus sed. Donec nec suscipit est.", "Integer maximus sapien risus, id viverra ex egestas non. Curabitur dignissim scelerisque consequat. Etiam sapien lectus, tristique eu consequat non, finibus in lorem. Cras vitae diam a orci iaculis auctor.", "Nunc efficitur, ligula sed gravida maximus, ex sem maximus magna, et convallis tellus sem nec odio. Donec semper nulla non felis euismod porttitor. Vivamus sodales faucibus est, sit amet suscipit eros. Sed at eros non mauris vehicula dapibus eu non metus. Nunc rutrum diam in justo tristique cursus.", "Morbi velit nulla, iaculis at erat nec, egestas mattis nulla. Aliquam eget volutpat felis. Sed vitae elit dignissim, pellentesque orci sit amet, accumsan ipsum. Donec bibendum eleifend purus, vel pellentesque dolor molestie quis. Quisque quam nibh, scelerisque facilisis lacus nec, auctor condimentum metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin, quam at imperdiet imperdiet, nunc turpis pretium risus, a molestie ligula ligula ac dui. Vestibulum non lorem dolor. Morbi id rutrum nibh.", "Morbi at eleifend metus. Nunc porta lacus id tortor gravida venenatis. Donec dictum magna orci, elementum ullamcorper nunc consectetur sit amet. Etiam non sapien dui. Curabitur cursus risus lacus, id sollicitudin mi vestibulum commodo. Nulla in vulputate ante, at pretium sapien. Aenean a elit eu tortor fermentum auctor. Quisque quis ex pellentesque, posuere libero eget, semper nunc. Donec maximus imperdiet velit, eu auctor augue molestie non. Proin nisi ipsum, congue eget nisi vitae, dignissim molestie mauris.", "Phasellus cursus aliquet iaculis. Curabitur dapibus lectus at arcu vulputate ultricies. Donec urna nibh, aliquam eu nisi in, feugiat mattis justo. Nulla facilisi. Cras lacinia felis lectus, vel euismod lorem auctor non. Aliquam ut cursus lorem. Ut sit amet arcu id ipsum volutpat eleifend.", "Quisque in finibus lectus, a consectetur ipsum. Nunc auctor suscipit mauris vel faucibus. Nam id urna sed orci tincidunt laoreet ac tincidunt augue. Integer rutrum, tortor quis venenatis rhoncus, sapien urna tincidunt leo, sed laoreet odio diam quis velit."]
    
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
    
    var mainTableView: CustomTableView = {
        var view = CustomTableView()
        var column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("Column"))
        view.intercellSpacing = NSSize(width: 100, height: 10)
        view.style = .fullWidth
        view.selectionHighlightStyle = .regular
        column.title = "Color"
        view.addTableColumn(column)
        view.headerView = nil
        view.ignoresMultiClick = true
        view.usesAutomaticRowHeights = true
    
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
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        if let row = userController?.user.count {
            return row + 1
        } else {
            return 1
        }
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
            tableCellView  = createView(tableView, identifier) as? CustomCellView
            var completed = 0
            var pending = 0
            
            user.todos.map{($0.status == "completed") ? (completed += 1) : (pending += 1)}
            tableCellView?.source = user
            
            tableCellView?.profileImage.image = NSImage(contentsOfFile: "/Users/naresh-pt6259/Downloads/Image/\(user.name).jpg")
            if let image = images[user.name]{
                tableCellView?.profileImage.image = image
            } else {
                self.downloadImage.downloader(user.url, "Image/\(user.name).jpg") {
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
            
            if row != tableView.selectedRow {
                tableCellView?.userName.attributedStringValue = NSMutableAttributedString(string: "\(user.name)", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 18, weight: .semibold)])
                tableCellView?.completedView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: "\(completed)", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
                tableCellView?.pendingView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: "\(pending)", attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
                tableCellView?.about.attributedStringValue = NSMutableAttributedString(string: attributedString[row - 1], attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.paragraphStyle: paraStyle])
            }
            
            if row == tableView.selectedRow {
                tableCellView?.userName.attributedStringValue = NSMutableAttributedString(string: user.name, attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 18, weight: .semibold)])
                tableCellView?.completedView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: "\(completed)", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
                tableCellView?.pendingView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: "\(pending)", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
                tableCellView?.about.attributedStringValue = NSMutableAttributedString(string: attributedString[row - 1], attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.paragraphStyle: paraStyle])
            }
            
            return tableCellView
        }
        
        return nil
    }
    
    func createView(_ tableView : NSTableView , _ identifier : NSUserInterfaceItemIdentifier) -> NSView? {
       var view = tableView.makeView(withIdentifier: identifier, owner: self) as? CustomCellView
        if view == nil {
            view = CustomCellView()
            view?.identifier =  identifier
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
        cell.about.attributedStringValue = NSMutableAttributedString(string: attributedString[tableView!.selectedRow - 1], attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.paragraphStyle: paraStyle])

        if let pView = previousView {
            guard let previousCell = tableView!.view(atColumn: 0, row: pView, makeIfNecessary: false) as? CustomCellView else { return }
            previousCell.userName.attributedStringValue = NSMutableAttributedString(string: previousCell.userName.stringValue, attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 18, weight: .semibold)])
            previousCell.completedView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: previousCell.completedView.noOfEntries.stringValue, attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
            previousCell.pendingView.noOfEntries.attributedStringValue = NSMutableAttributedString(string: previousCell.pendingView.noOfEntries.stringValue, attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold)])
            previousCell.about.attributedStringValue = NSMutableAttributedString(string: previousCell.about.stringValue, attributes: [NSAttributedString.Key.foregroundColor: NSColor.white, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.paragraphStyle: paraStyle])
        }
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let tableView = notification.object as? NSTableView
        previousView = tableView?.selectedRow
    }
   
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        return CustomTableRowView()
    }
    
    @objc func refreshData() {
        DispatchQueue.global(qos: .background).async {
            self.userController?.getUsers()
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500)) {
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
        let label =  NSTextField(labelWithAttributedString: NSAttributedString(string: "To-Do Users", attributes: [NSAttributedString.Key.foregroundColor: NSColor.black, NSAttributedString.Key.font: NSFont.systemFont(ofSize: 18, weight: .bold)]))
        
        return label
    }()
    
    let refreshBtn: NSButton = {
        let button = NSButton()
        let btnImg = NSImage(systemSymbolName: "arrow.triangle.2.circlepath", accessibilityDescription: nil)
        var config = NSImage.SymbolConfiguration(textStyle: .headline, scale: .large)
        
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
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
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
    var source: UserModel.User?
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
        imageView.layer?.borderColor = .init(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        imageView.layer?.borderWidth = 1.5
        imageView.imageScaling = .scaleAxesIndependently
        return imageView
    }()
    
    let userName: NSTextField = {
        let textField = NSTextField(labelWithAttributedString: NSMutableAttributedString(string: ""))
        textField.frame = NSRect(x: 90, y: 50, width: 250, height: 25)
        return textField
    }()
    
    let about: NSTextField = {
        let textField = NSTextField(labelWithAttributedString: NSMutableAttributedString(string: ""))
        textField.frame = NSRect(x: 90, y: 50, width: 250, height: 25)
        textField.lineBreakMode = .byWordWrapping
        textField.alignment = NSTextAlignment.justified
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
        
        img = NSImage(systemSymbolName: "clock.arrow.circlepath", accessibilityDescription: nil)
        
        config = config.applying(.init(paletteColors: [.orange]))
        pendingView.statusImage.image = img?.withSymbolConfiguration(config)
        
        self.addSubviewAndConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func mouseDown(with event: NSEvent) {
        super.mouseDown(with: event)
        nextResponder?.mouseDown(with: event)
    }
    
    func addSubviewAndConstraint() {
        userName.translatesAutoresizingMaskIntoConstraints = false
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        completedView.translatesAutoresizingMaskIntoConstraints = false
        pendingView.translatesAutoresizingMaskIntoConstraints = false
        about.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(userName)
        self.addSubview(profileImage)
        self.addSubview(completedView)
        self.addSubview(pendingView)
        self.addSubview(about)
        
        NSLayoutConstraint.activate([
//            profileImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
//            profileImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            profileImage.widthAnchor.constraint(equalToConstant: 60),
            profileImage.heightAnchor.constraint(equalToConstant: 60),

            userName.topAnchor.constraint(equalTo: profileImage.topAnchor),
            userName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
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
            
            about.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 15),
            about.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            about.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            about.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
        ])
    }
    
    override func prepareForReuse() {
        userName.stringValue = ""
        profileImage.image = NSImage(systemSymbolName: "arrow.triangle.2.circlepath", accessibilityDescription: nil)!
        completedView.noOfEntries.stringValue = ""
        pendingView.noOfEntries.stringValue = ""
        about.stringValue = ""
        self.layer?.backgroundColor = .clear
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
    
    override func mouseDown(with event: NSEvent) {
        
        if let view = self.view(atColumn: 0) as? CustomCellView {
            print(self.superview)
        }
    }
    
    override func updateTrackingAreas() {
//        super.updateTrackingAreas()
        if !isGroupRowStyle {
            addTrackingArea(NSTrackingArea(rect: self.bounds, options: [.activeAlways,.mouseEnteredAndExited], owner: self))
        }
    }
    
    override func mouseEntered(with event: NSEvent) {
        if let view = self.view(atColumn: 0) as? CustomCellView {
            view.layer?.backgroundColor = .init(gray: 0.2, alpha: 0.8)
//            let outline = self.superview as? NSOutlineView
//            outline?.expandItem(outline?.item(atRow: (outline?.row(for: view))!))
        }
    }
    
    override func mouseExited(with event: NSEvent) {
        if let view = self.view(atColumn: 0) as? CustomCellView {
            view.layer?.backgroundColor = .clear
//            let outline = self.superview as? NSOutlineView
//            outline?.collapseItem(outline?.item(atRow: (outline?.row(for: view))!))
        }
    }
    
    override func drawBackground(in dirtyRect: NSRect) {
        if isGroupRowStyle {
            return
        }
    }
    
    override func drawSelection(in dirtyRect: NSRect) {
        if self.selectionHighlightStyle != .none {
            let selectionRect = NSInsetRect(self.bounds, 8.0, 7.0)
            NSColor(calibratedWhite: 0.65, alpha: 1).setStroke()
            NSColor(calibratedWhite: 0.82, alpha: 1).setFill()
            let selectionPath = NSBezierPath.init(roundedRect: selectionRect, xRadius: 10, yRadius: 10)
            selectionPath.fill()
            selectionPath.stroke()
        }
    }
}

class CustomTableView: NSTableView {
    override func drawBackground(inClipRect clipRect: NSRect) {
        return
    }
}
