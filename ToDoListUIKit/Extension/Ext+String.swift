//
//  Ext+String.swift
//  ToDoListUIKit
//
//  Created by admin on 22/11/2024.
//

import Foundation
import UIKit

extension String {
    func textHeight(frameWidth: CGFloat, font: UIFont?) -> CGFloat {
        let maxSize = CGSize(width: frameWidth, height: CGFloat(MAXFLOAT))
        let text = self
        let textHeight = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font ?? 0], context: nil).height
        return textHeight
    }
}
