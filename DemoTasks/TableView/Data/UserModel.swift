//
//  UserModel.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 16/03/23.
//

import Foundation

class UserModel: Codable {
    var metadata: Metadata
    var record: Record
    
    class Metadata: Codable {
        var createdAt: String
        var id: String
        var name: String
        var `private`: Bool
    }
    
    class Record: Codable {
        var users: [User]
    }
    
    class User: Codable {
        var userId: Int
        var name: String
        var url: String
        var description: String
        var todos: [ToDo]
    }
    
    class ToDo: Codable {
        var todoId: Int
        var description: String
        var status: String
    }
}
