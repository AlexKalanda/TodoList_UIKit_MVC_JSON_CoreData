//
//  CoreManager.swift
//  ToDoListUIKit
//
//  Created by admin on 15/11/2024.
//

import Foundation
import CoreData

final class CoreManager {
    static let shared = CoreManager(); private init() { fetchAllTodos() }
    var todos = [Todo]()

    // MARK:  Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoListUIKit")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
//MARK: - CRUD
    // MARK:  Create
    func createData(todoData: TodoModel) {
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: persistentContainer.viewContext)
        entity.setValue(todoData.id, forKey: "id")
        entity.setValue(todoData.desc, forKey: "desc")
        entity.setValue(todoData.todo, forKey: "todo")
        entity.setValue(todoData.date, forKey: "date")
        entity.setValue(todoData.completed, forKey: "completed")
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Error saving context \(error)")
        }
    }
    
    // Сохранение
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    // MARK:  Read
    func fetchAllTodos() {
        let req = Todo.fetchRequest()
        if let todos = try? persistentContainer.viewContext.fetch(req) {
            self.todos = todos
        }
    }
    // MARK:  New
    func addNewTodo(title: String, description: String, date: Date) {
        let todo = Todo(context: persistentContainer.viewContext)
        todo.id = Int16.random(in: 31...100)
        todo.desc = description
        todo.todo = title
        todo.date = date
        todo.completed = false
        self.saveContext()
        self.fetchAllTodos()
    }
    //  Выполнение задания(отмена выполнения)
     func completeTodo(at index: Int) {
        let todo = self.todos[index]
        todo.completed.toggle()
        self.saveContext()
    }
    // Поиск
    func fetchSearchedTodos(searchText: String)  {
        let req = Todo.fetchRequest()
        req.predicate = NSPredicate(format: "todo CONTAINS[c] %@", searchText)
        if let todos = try? persistentContainer.viewContext.fetch(req) {
            self.todos = todos
        }
    }
}
