//
//  TaskModel.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import Foundation

struct TaskModel: Codable, Identifiable {
    let id: String
    let title: String
    let context: String
    let dueDate: TimeInterval
    let addedDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
