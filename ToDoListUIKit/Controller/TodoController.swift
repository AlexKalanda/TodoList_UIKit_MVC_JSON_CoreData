//
//  ViewController.swift
//  ToDoListUIKit
//
//  Created by admin on 15/11/2024.
//

import UIKit

final class TodoController: UIViewController {
    
    private let mainView = TodoView()
    private var todos: TodoListResponse?
    private let coreManager = CoreManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        getData()
        updataFooter()
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Задачи"
        mainView.searchController.searchResultsUpdater = self
        navigationItem.searchController = mainView.searchController
        mainView.addTodo.addTarget(self, action: #selector(addTodo), for: .touchUpInside)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor(hex: "#FED702")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
        updataFooter()
        mainView.tableView.reloadData()
    }
    
    // MARK:  Получение данных с JSON и добавление их в СoreData
    func getData() {
        NetworkService.shared.getTodo(completion: {result in
            switch result {
            case .success(let todos):
                DispatchQueue.main.async {
                    self.todos = todos
                    if self.coreManager.todos.isEmpty {
                        for todo in todos.todos {
                            self.coreManager.createData(todoData: todo)
                            self.coreManager.fetchAllTodos()
                            self.updataFooter()
                            self.mainView.tableView.reloadData()
                        }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    // MARK:  Обнавление количества задач в нижний колонтитул
    func updataFooter() {
        if coreManager.todos.isEmpty {
            self.mainView.lableCountTodo.text = "Нет Задач"
        } else {
            self.mainView.lableCountTodo.text = "\(coreManager.todos.count) Задач"
        }
    }
    // MARK:  Выполнение задачи
    @objc func complitedPressed(_ sender: UIButton) {
        coreManager.completeTodo(at: sender.tag)
        mainView.tableView.reloadData()
    }
    // MARK: Действие при нажатии на кнопку создания новай заметки
    @objc func addTodo() {
        let vc = NewTodoController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - Расшерение для контроллера(DataSource)
extension TodoController: UITableViewDataSource {
    //MARK:  Количество ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreManager.todos.count
    }
    
    //MARK:  Вид ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.reuseID) as! TodoCell
        let currentTodo = coreManager.todos[indexPath.row]
        cell.setupCell(with: currentTodo, cellIndex: indexPath.row)
        cell.buttonComplete.addTarget(self, action: #selector (complitedPressed), for: .touchUpInside)
        
        return cell
    }
}
//MARK: - Расшерение для контроллера(Delegate)
extension TodoController: UITableViewDelegate {
    //MARK:  Нажатие на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = coreManager.todos[indexPath.row]
        let vc = DetailController()
        vc.todo = todo
        navigationController?.pushViewController(vc, animated: true)
    }
    // MARK:  Контекстное меню
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { action in
            //редактирование
            let edit = UIAction(title: "Редактировать",
                                image: UIImage(systemName: "square.and.pencil")) { action in
                let vc = EditController()
                vc.todo = self.coreManager.todos[indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
            }
            let share = UIAction(title: "Поделиться",
                                 image: UIImage(systemName: "square.and.arrow.up")) { action in
                
            }
            // удаление
            let delete = UIAction(title: "Удалить",
                                  image: UIImage(systemName: "trash"),
                                  attributes: .destructive) { action in
                let currentTodo = self.coreManager.todos[indexPath.row]
                currentTodo.deleteTodo()
                
                if self.mainView.searchController.searchBar.text == "" {
                    self.coreManager.fetchAllTodos()
                } else {
                    self.coreManager.fetchSearchedTodos(searchText: self.mainView.searchController.searchBar.text ?? "")
                }
                
                self.updataFooter()
                self.mainView.tableView.reloadData()
            }
            return UIMenu(title: "", children: [edit, share, delete])
        }
    }
}
//MARK: - Расшерение для  поиска
extension TodoController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text == "" {
            coreManager.fetchAllTodos()
            self.updataFooter()
            mainView.tableView.reloadData()
        } else {
            coreManager.fetchSearchedTodos(searchText: searchController.searchBar.text!)
            self.updataFooter()
            mainView.tableView.reloadData()
        }
    }
}


