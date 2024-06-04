//
//  PastTaskViewModel.swift
//  ToDoList
//
//  Created by Caner Karabulut on 3.06.2024.
//

import Foundation
import FirebaseFirestore

class PastTaskViewModel: ObservableObject {
    
    @Published var tasks: [TaskModel] = []
    @Published var showingNewTaskView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).collection("deleted_tasks").document(id).delete { error in
            if let error = error {
                print("Error deleting document: \(error)")
            } else {
                print("Document successfully deleted")
                self.tasks.removeAll { $0.id == id }
            }
        }
    }
}
