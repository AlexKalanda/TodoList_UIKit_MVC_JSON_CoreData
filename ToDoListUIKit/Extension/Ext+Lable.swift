//
//  Ext+Lable.swift
//  ToDoListUIKit
//
//  Created by admin on 21/11/2024.
//

import Foundation
import UIKit

extension UILabel {
    func strikeThrough(todo: Todo, color: UIColor) {
        let attributedString = NSMutableAttributedString(string: todo.todo!)
        attributedString.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
        attributedString.addAttribute(.strikethroughColor, value: color, range: NSRange(location: 0, length: attributedString.length))
        attributedText = attributedString
    }
}
