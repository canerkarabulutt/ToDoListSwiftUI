//
//  NewTaskViewModel.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import Foundation

class NewTaskViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var dueDate = Date()
    
    init() {}
    
    func save() {
        
    }
}
