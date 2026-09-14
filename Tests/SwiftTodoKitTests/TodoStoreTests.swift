//
//  TodoStoreTests.swift
//  SwiftTodoKit
//
//  Created by Asma on 14.09.26.
//

import Foundation
import Testing
@testable import SwiftTodoKit

@MainActor
struct TodoStoreTests {

    @Test
    func addAppendsInOrder() {
        let store = TodoStore()
        store.add("First")
        store.add("Second")

        #expect(store.todos.count == 2)
        #expect(store.todos[0].title == "First")
        #expect(store.todos[1].title == "Second")
    }

    @Test
    func newTodoIsNotCompleted() {
        let store = TodoStore()
        store.add("First")

        #expect(store.todos[0].isCompleted == false)
    }

    @Test
    func toggleAffectsOnlyTheTargetTodo() {
        let store = TodoStore()
        store.add("First")
        store.add("Second")

        store.toggle(store.todos[0].id)

        #expect(store.todos[0].isCompleted)
        #expect(store.todos[1].isCompleted == false)
    }

    @Test
    func toggleWithUnknownIDChangesNothing() {
        let store = TodoStore()
        store.add("First")

        store.toggle(UUID())

        #expect(store.todos[0].isCompleted == false)
    }

    @Test
    func removeDeletesOnlyTheTargetTodo() {
        let store = TodoStore()
        store.add("First")
        store.add("Second")

        store.remove(store.todos[0].id)

        #expect(store.todos.count == 1)
        #expect(store.todos[0].title == "Second")
    }
}
