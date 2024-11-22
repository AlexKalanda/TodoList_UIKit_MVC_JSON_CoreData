//
//  DateHelper.swift
//  ToDoListUIKit
//
//  Created by admin on 18/11/2024.
//

import Foundation

final class DateHelper {
    static func toString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter.string(from: date)
    }
}
