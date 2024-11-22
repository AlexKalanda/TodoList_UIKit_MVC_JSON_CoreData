//
//  EditView.swift
//  ToDoListUIKit
//
//  Created by admin on 22/11/2024.
//

import UIKit

final class EditView: NewTodoView {
    var todo: Todo
 
    init(todo: Todo) {
        self.todo = todo
        super.init()
    }
    override func setViews() {
        super.setViews()
        titleTF.text = todo.todo
        descriptionTF.text = todo.desc
        datePicer.date = todo.date ?? .init()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
