//
//  TaskListViewModel.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import Foundation
import FirebaseFirestore

class TaskListViewModel: ObservableObject {
    
    @Published var tasks: [TaskModel] = []
    @Published var showingNewTaskView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        let deletedTaskRef = db.collection("users").document(userId).collection("tasks").document(id)
        
        deletedTaskRef.getDocument { document, error in
            if let document = document, document.exists {
                let data = document.data() ?? [:]
                db.collection("users").document(self.userId).collection("deleted_tasks").addDocument(data: data)
                deletedTaskRef.delete()
            }
        }
    }

}
