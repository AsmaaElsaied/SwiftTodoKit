//
//  Todo.swift
//  SwiftTodoKit
//
//  Created by Asma on 14.09.26.
//

import Foundation

public struct Todo: Identifiable, Equatable, Codable {
    public let id: UUID
    public var title: String
    public var isCompleted: Bool
    
    public init(id: UUID = UUID(), title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}
