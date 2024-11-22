//
//  Todo+CoreDataProperties.swift
//  ToDoListUIKit
//
//  Created by admin on 15/11/2024.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var id: Int16
    @NSManaged public var todo: String?
    @NSManaged public var completed: Bool
    @NSManaged public var userId: Int16
    @NSManaged public var date: Date?
    @NSManaged public var desc: String?

}


extension Todo : Identifiable {
    // MARK:  Update / редактирование
    func updateTodo(newTitle: String, newDesc: String, newCompleted: Bool, newDate: Date) {
        self.desc = newDesc
        self.todo = newTitle
        self.completed = newCompleted
        self.date = newDate
        
        try? managedObjectContext?.save()
    }
    // MARK:  Delete
    func deleteTodo() {
        managedObjectContext?.delete(self)
        try? managedObjectContext?.save()
    }
    
}
