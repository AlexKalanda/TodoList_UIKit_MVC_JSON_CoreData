//
//  URLManager.swift
//  ToDoListUIKit
//
//  Created by admin on 15/11/2024.
//

import Foundation

final class URLManager {
    static let shared = URLManager(); private init() { }
    
    private let getaway = "https://"
    private let server = "dummyjson.com/todos"
    
    func createURL() -> URL? {
        let urlStr = getaway + server
        return URL(string: urlStr)
    }
}
