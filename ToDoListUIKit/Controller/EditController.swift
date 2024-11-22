//
//  EditController.swift
//  ToDoListUIKit
//
//  Created by admin on 22/11/2024.
//

import UIKit

final class EditController: NewTodoController {
    var todo: Todo!
    lazy var mainView = EditView(todo: self.todo)
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        navigationItem.rightBarButtonItem?.action = #selector(upDateTodo)
    }
     @objc func upDateTodo() {
         self.todo.updateTodo(newTitle: mainView.titleTF.text ?? "",
                              newDesc: mainView.descriptionTF.text,
                              newCompleted: todo.completed,
                              newDate: mainView.datePicer.date)
         navigationController?.popViewController(animated: true)
    }
}
