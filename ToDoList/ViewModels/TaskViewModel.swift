//
//  TaskViewModel.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TaskViewModel: ObservableObject {
    init() {}
    
    
    func toggleIsDone(task: TaskModel) {
        var taskCopy = task
        taskCopy.setDone(!task.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        db.collection("users").document(uid).collection("tasks").document(taskCopy.id).setData(taskCopy.asDictionary())
    }
    
    func updateTask(task: TaskModel) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        db.collection("users").document(uid).collection("tasks").document(task.id).setData(task.asDictionary())
        
    }
}
