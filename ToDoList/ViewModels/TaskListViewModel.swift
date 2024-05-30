//
//  TaskListViewModel.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import Foundation
import FirebaseFirestore

class TaskListViewModel: ObservableObject {
    
    @Published var showingNewTaskView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).collection("tasks").document(id).delete()
    }
}
