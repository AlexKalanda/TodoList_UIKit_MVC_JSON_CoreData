//
//  TodoModel.swift
//  ToDoListUIKit
//
//  Created by admin on 15/11/2024.
//

import Foundation

struct TodoListResponse: Decodable {
    var total: Int
    var skip: Int
    var limit: Int
    var todos: [TodoModel]
}

struct TodoModel: Decodable {
    var id: Int
    var todo: String
    var completed: Bool
    var userId: Int
    var date: Date?
    var desc: String?
}
