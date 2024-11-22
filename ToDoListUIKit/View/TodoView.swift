//
//  TodoView.swift
//  ToDoListUIKit
//
//  Created by admin on 15/11/2024.
//

import UIKit

final class TodoView: UIView {
    
    let tableView = UITableView()
    let bottonView = UIView()
    let lableCountTodo = UILabel()
    let addTodo = UIButton()
    let searchController = UISearchController(searchResultsController: nil)
    
    init() {
        super.init(frame: .zero)
        setConstraints()
        setViews()
    }
    
    func setViews() {
        self.backgroundColor = UIColor.color(light: .white, dark: .black)
        tableView.register(TodoCell.self, forCellReuseIdentifier: TodoCell.reuseID)
        bottonView.backgroundColor = UIColor.color(light: .placeholderText,
                                                   dark: .black)
        bottonView.alpha = 0.8
        lableCountTodo.textColor = UIColor.color(light: .black, dark: .white)
        lableCountTodo.font = .systemFont(ofSize: 11)
        addTodo.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        addTodo.tintColor = UIColor(hex: "#FED702")
        searchController.searchBar.showsBookmarkButton = true
        searchController.searchBar.setImage(UIImage(systemName: "mic.fill"), for: .bookmark, state: .normal)
        searchController.searchBar.tintColor = UIColor(hex: "#FED702")
        searchController.searchBar.placeholder = "Поиск"
    }
    
    func setConstraints() {
        bottonView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.1).isActive = true
        let stack = UIStackView(arrangedSubviews: [tableView, bottonView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 0
        self.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        bottonView.addSubview(addTodo)
        addTodo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addTodo.rightAnchor.constraint(equalTo: bottonView.rightAnchor , constant: -20),
            addTodo.centerYAnchor.constraint(equalTo: bottonView.centerYAnchor,constant: -10)
            ])
        
        bottonView.addSubview(lableCountTodo)
        lableCountTodo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lableCountTodo.centerXAnchor.constraint(equalTo: bottonView.centerXAnchor),
            lableCountTodo.centerYAnchor.constraint(equalTo: bottonView.centerYAnchor,constant: -10)
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
