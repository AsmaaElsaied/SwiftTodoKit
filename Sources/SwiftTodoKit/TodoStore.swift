//
//  TodoStore.swift
//  SwiftTodoKit
//
//  Created by Asma on 14.09.26.
//

import Foundation

@MainActor
@Observable
public final class TodoStore {
    public private(set) var todos: [Todo] = []
    
    public init() {}
    
    public func add(_ title: String) {
        let newTodo = Todo(title: title)
        todos.append(newTodo)
    }
    
    public func toggle(_ id: Todo.ID) {
        guard let index = todos.firstIndex(where: { $0.id == id}) else { return }
        todos[index].isCompleted.toggle()
    }
    
    public func remove(_ id: Todo.ID) {
        todos.removeAll(where: { $0.id == id})
    }
    
    public func removeAll() {
        todos.removeAll()
    }
}
