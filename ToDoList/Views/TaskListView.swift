//
//  TaskListView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TaskListView: View {
    
    @StateObject var viewModel: TaskListViewModel
    @FirestoreQuery var tasks: [TaskModel]
    
    
    init(userId: String) {
        self._tasks = FirestoreQuery(collectionPath: "users/\(userId)/tasks")
        
        self._viewModel = StateObject(wrappedValue: TaskListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(tasks) { task in
                    TaskView(task: task)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: task.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewTaskView = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.green)
                }
            }
            .sheet(isPresented: $viewModel.showingNewTaskView, content: {
                NewTaskView(newItemPresented: $viewModel.showingNewTaskView)
            })
        }
    }
}

#Preview {
    TaskListView(userId: "6DBkISCgwWeCdc09UrMGEm2jpwB3")
}
