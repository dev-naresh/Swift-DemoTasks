//
//  UserModel.swift
//  DemoTasks
//
//  Created by naresh-pt6259 on 16/03/23.
//

import Foundation

struct UserModel: Codable {
    var metadata: Metadata
    var record: Record
    
    struct Metadata: Codable {
        var createdAt: String
        var id: String
        var name: String
        var `private`: Bool
    }
    
    struct Record: Codable {
        var users: [User]
    }
    
    struct User: Codable {
        var userId: Int
        var name: String
        var url: String
        var todos: [ToDo]
    }
    
    struct ToDo: Codable {
        var todoId: Int
        var description: String
        var status: String
    }
}
