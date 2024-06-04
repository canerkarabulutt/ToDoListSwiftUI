//
//  PastTaskView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 3.06.2024.
//

import SwiftUI

struct PastTaskView: View {
    
    @StateObject var viewModel = TaskViewModel()
    
    let task: TaskModel
    
    var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text(task.title)
                        .font(.body)
                        .italic()
                        .bold()
                        .foregroundStyle(Color(.label.withAlphaComponent(0.6)))
                    Text("\(Date(timeIntervalSince1970: task.dueDate).formatted(date: .abbreviated, time: .shortened))")
                        .font(.footnote)
                        .foregroundStyle(Color(.secondaryLabel))
                }
                Spacer()
                Button {
                    viewModel.toggleIsDone(task: task)
                } label: {
                    Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(Color.red.opacity(0.5))
                }
            }
        NavigationLink("Click to show more details...", destination: PastTaskDetailView(task: TaskModel(
            id: task.id,
            title: task.title,
            context: task.context,
            dueDate: task.dueDate,
            addedDate: task.addedDate,
            isDone: false
        )))
        .font(.footnote)
        .foregroundStyle(.red.opacity(0.8))
        .bold()
        }
    }


#Preview {
    PastTaskView(task: .init(id: "123", title: "Get Food", context: "Banana, apple, peach...", dueDate: Date().timeIntervalSince1970, addedDate: Date().timeIntervalSince1970, isDone: true))
}
