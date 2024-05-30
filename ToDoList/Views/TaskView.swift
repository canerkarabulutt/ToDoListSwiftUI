//
//  TaskView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import SwiftUI

struct TaskView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    let task: TaskModel
    
    var body: some View {
        NavigationStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(task.title)
                        .font(.body)
                        .italic()
                        .bold()
                    Text("\(Date(timeIntervalSince1970: task.dueDate).formatted(date: .abbreviated, time: .shortened))")
                        .font(.footnote)
                        .foregroundStyle(Color(.secondaryLabel))
                }
                Spacer()
                
                Button {
                    viewModel.toggleIsDone(task: task)
                } label: {
                    Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                }
            }
        }
    }
}

#Preview {
    TaskView(task: .init(id: "123", title: "Get Food", dueDate: Date().timeIntervalSince1970, addedDate: Date().timeIntervalSince1970, isDone: true))
}
