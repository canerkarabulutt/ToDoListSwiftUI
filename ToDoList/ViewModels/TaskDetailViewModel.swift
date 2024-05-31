//
//  TaskDetailViewModel.swift
//  ToDoList
//
//  Created by Caner Karabulut on 30.05.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TaskDetailViewModel: ObservableObject {
    
    func updateTask(task: TaskDetailModel) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        db.collection("users").document(uid).collection("tasks").document(task.id).setData(task.asDictionary())
    }
}
