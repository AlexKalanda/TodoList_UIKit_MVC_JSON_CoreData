//
//  HTTPError.swift
//  ToDoListUIKit
//
//  Created by admin on 15/11/2024.
//

import Foundation

enum HTTPError: Error {
    case invalidURL, badRequest, badResponce, invalidDecoding, invalidEncoding
}
