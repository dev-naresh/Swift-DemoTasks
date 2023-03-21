//
//  UserController.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 16/03/23.
//

import Foundation
import Cocoa

class UserController: URLSessionDataTask, URLSessionDataDelegate {
    let opQueue = OperationQueue()
    lazy var session = URLSession(configuration: .default, delegate: self, delegateQueue: opQueue)
    var downloadObj: URLSessionDownloadTask?
    let apiUrl = "https://api.jsonbin.io/v3/b/64119e81ebd26539d08efdde"
    var user = [UserModel.User]()
    
    func getUsers() {
        guard let url = URL(string: self.apiUrl) else {
            print("Invalid link...")
            return
        }
        
        //Creating "GET" request
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        req.allHTTPHeaderFields = ["X-Master-Key":"$2b$10$9LB0uG.DnCTNK2AO4edCvO7JCywcxlkOR4rwT1Qjs5QMeyeSLIphm"]
        
        let dispGroup = DispatchGroup()
        let session = URLSession.shared.dataTask(with: req) {
            data, response, error in
            
            dispGroup.enter()
            if let error = error {
                print(error.localizedDescription)
            } else {
                if let data = data {
                    do {
                        let testObj = try JSONDecoder().decode(UserModel.self, from: data)
                        self.user = testObj.record.users
                        dispGroup.leave()
                    } catch {
                        print(error)
                    }
                }
            }
            dispGroup.wait()
        }
        session.resume()
    }
}

class DownloadImage: NSObject, URLSessionDownloadDelegate {
    let opQueue = OperationQueue()
    lazy var session = URLSession(configuration: .default, delegate: self, delegateQueue: self.opQueue)
    var downloadObj: URLSessionDownloadTask?
    var filePathEnd: String?
    var resumeData: Data?
    var apiUrl: String?
    var filePath: URL?
    var fileEndPathDict = [URL: URL]()
    
    override init() {
        opQueue.maxConcurrentOperationCount = 5
    }
    
    //DownloadTask processed in the background thread.
    func downloader(_ url: String, _ fileUrl: String, _ completion: @escaping (NSImage, URL) -> Void ) {
        self.apiUrl = url
        self.filePathEnd = fileUrl
        self.filePath = try! FileManager.default.url(for: .downloadsDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(String(self.filePathEnd!))
    
        guard let url = URL(string: apiUrl!) else {
            print("Invalid URL...")
            return
        }
        fileEndPathDict[url] = filePath!
        
        if let image = NSImage(contentsOfFile: "/Users/naresh-pt6259/Downloads/\(filePathEnd!)") {
            completion(image, url)
        } else {
            self.downloadObj = self.session.downloadTask(with: url) { [ self ]
                location, response, error in
                if let error = error {
                    completion(NSImage(systemSymbolName: "person.fill", accessibilityDescription: nil)!, url)
                } else {
                    try? FileManager.default.removeItem(at: self.filePath!)
                    try? FileManager.default.moveItem(at: location!, to: self.fileEndPathDict[(response?.url)!]!)
                    completion(NSImage(byReferencing: self.fileEndPathDict[response!.url!]!), response!.url!)
                    try? FileManager.default.removeItem(at: self.filePath!)
                }
            }
            downloadObj?.resume()
        }
    }
    
    //Pause the current downloadTask.
    func pause() {
        downloadObj?.cancel { [weak self]
            resumeDataOrNil in
            
            guard let resumeData = resumeDataOrNil else {
                print("No downloads currently...")
                return
            }
            self?.downloadObj = self?.session.downloadTask(withResumeData: resumeData)
            print(self?.downloadObj ?? "")
            self?.resumeData = resumeData
        }
    }
    
    //Resume the paused downloadTask
    func resume(){
        guard let resumeDel = downloadObj else {
            print("Resume fail...")
            return
        }
        resumeDel.resume()
    }
    
    // Moving downloaded data to desired location.
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Downloading...")
//        print(Thread.isMainThread)
        try? FileManager.default.removeItem(at: filePath!)
        try? FileManager.default.moveItem(at: location, to: self.filePath!)
    }
    
    //DownloadTask progress indicator in terminal.
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Int(Float(totalBytesWritten) / Float(totalBytesExpectedToWrite) * 100)
        print("Downloading: \(progress)%")
    }
    
}
