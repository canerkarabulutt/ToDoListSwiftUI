//
//  TaskView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import SwiftUI

struct TaskView: View {
    
    @StateObject var viewModel = TaskViewModel()
    
    let task: TaskModel
    
    var body: some View {
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
                        .foregroundStyle(Color.green)
                }
            }
        NavigationLink("Click to show more details...", destination: TaskDetailView(task: TaskDetailModel(
            id: task.id,
            title: task.title,
            context: task.context,
            dueDate: task.dueDate,
            addedDate: task.addedDate)))
        .font(.footnote)
        .foregroundStyle(.green)
        .bold()
        }
    }


#Preview {
    TaskView(task: .init(id: "123", title: "Get Food", context: "Banana, apple, peach...", dueDate: Date().timeIntervalSince1970, addedDate: Date().timeIntervalSince1970, isDone: true))
}
