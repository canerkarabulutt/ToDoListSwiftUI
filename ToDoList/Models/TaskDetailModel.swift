//
//  TaskDetailModel.swift
//  ToDoList
//
//  Created by Caner Karabulut on 30.05.2024.
//

import Foundation

struct TaskDetailModel: Codable, Identifiable {
    let id: String
    let title: String
    var context: String
    let dueDate: TimeInterval
    let addedDate: TimeInterval
    
}

