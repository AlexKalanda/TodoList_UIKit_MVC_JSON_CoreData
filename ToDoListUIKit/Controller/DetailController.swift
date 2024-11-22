//
//  DetailController.swift
//  ToDoListUIKit
//
//  Created by admin on 21/11/2024.
//

import UIKit

final class DetailController: UIViewController {
    var todo: Todo!
    lazy var mainView = DetailView(todo: self.todo)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
    }
    
}
