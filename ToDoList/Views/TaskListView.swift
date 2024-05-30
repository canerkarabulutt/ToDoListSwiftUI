//
//  TaskListView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import SwiftUI

struct TaskListView: View {
    
    @StateObject var viewModel = TaskListViewModel()
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
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
    TaskListView(userId: "")
}
