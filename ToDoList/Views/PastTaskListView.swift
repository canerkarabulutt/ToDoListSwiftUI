//
//  PastTaskListView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 3.06.2024.
//

import SwiftUI
import FirebaseFirestoreSwift

struct PastTaskListView: View {
    
    @FirestoreQuery var deletedTasks: [TaskModel]
    
    init(userId: String) {
        self._deletedTasks = FirestoreQuery(collectionPath: "users/\(userId)/deleted_tasks")
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(deletedTasks) { task in
                    PastTaskView(task: task)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Past Tasks")
        }
    }
}

#Preview {
    PastTaskListView(userId: "6DBkISCgwWeCdc09UrMGEm2jpwB3")
}
