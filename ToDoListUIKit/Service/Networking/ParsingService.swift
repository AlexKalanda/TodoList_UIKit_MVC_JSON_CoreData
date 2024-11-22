//
//  ParsingService.swift
//  ToDoListUIKit
//
//  Created by admin on 15/11/2024.
//

import Foundation

final class ParsingService {
    static let shared = ParsingService(); private init() { }
    private let decoder: JSONDecoder = {
        var decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func getTodos(fromData data: Data) -> TodoListResponse {
        try! decoder.decode(TodoListResponse.self, from: data)
    }
}
