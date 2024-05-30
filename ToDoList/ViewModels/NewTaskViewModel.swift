//
//  NewTaskViewModel.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewTaskViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else { return }
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let newID = UUID().uuidString
        
        let newTask = TaskModel(id: newID, title: title, dueDate: dueDate.timeIntervalSince1970, addedDate: Date().timeIntervalSince1970, isDone: false)
        
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("tasks").document(newID).setData(newTask.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { 
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
