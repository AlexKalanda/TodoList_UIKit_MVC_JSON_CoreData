//
//  NetworkService.swift
//  ToDoListUIKit
//
//  Created by admin on 15/11/2024.
//

import Foundation

final class NetworkService {
    
    static let shared = NetworkService(); private init() { }
    private let session = URLSession.shared
    
    func getTodo(completion: @escaping (Result<TodoListResponse,Error>) -> ()) {
        guard let url = URLManager.shared.createURL() else {
            completion(.failure(HTTPError.invalidURL))
            return
        }
        session.dataTask(with: url) { data, response, error in
            guard let data, let response else {
                if let error { completion(.failure(error)) }
                return
            }
            let statusCode = (response as! HTTPURLResponse).statusCode
            guard statusCode / 100 == 2 else { return }
            let todos = ParsingService.shared.getTodos(fromData: data)
            completion(.success(todos))
        }.resume()
    }
    
}
