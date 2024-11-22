//
//  NewTodoController.swift
//  ToDoListUIKit
//
//  Created by admin on 20/11/2024.
//

import UIKit

class NewTodoController: UIViewController {
    private let mainView = NewTodoView()
    private let coreManager = CoreManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Готово",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(saveAction))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(hex: "#FED702")
    }
    
    @objc func saveAction() {
        guard let title = mainView.titleTF.text,
              let description = mainView.descriptionTF.text else { return }
        guard !title.isEmpty else {
            navigationController?.popViewController(animated: true);
            return
        }
        coreManager.addNewTodo(title: title, description: description, date: mainView.datePicer.date)
        navigationController?.popViewController(animated: true)
    }
}
