//
//  TaskDetailView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 30.05.2024.
//

import SwiftUI

struct TaskDetailView: View {
    
    @State var input = ""
    @State var task: TaskModel
    @StateObject var viewModel = TaskViewModel()

    @State private var isEditing = false

    var body: some View {
        VStack {
            DetailHeaderView(title: task.title, subtitle: "", angle: 0, background: .green)
                .frame(width: UIScreen.main.bounds.width*2,height: UIScreen.main.bounds.height/12)
                .offset(y: -20)
            HStack {
                CustomButton(title: "Edit", background: .green) {
                    isEditing.toggle()
                    self.input = task.context
                }
                .frame(width: UIScreen.main.bounds.width/4 ,height: UIScreen.main.bounds.width/8)
              //  .offset(y: -20)
                CustomButton(title: "Save", background: .red) {
                    task.context = input
                    viewModel.updateTask(task: task)
                    isEditing.toggle()
                }
                .frame(width: UIScreen.main.bounds.width/4 ,height: UIScreen.main.bounds.width/8)
               // .offset(y: -20)
            }
            Spacer()
        }
        Spacer()
        if isEditing {
            TextEditor(text: $input)
                .frame(height: UIScreen.main.bounds.height/3)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 2)
                )
        } else {
            Text(task.context)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
                .padding()
                .position(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/15)
                .bold()
        }
        Spacer()
    }
}

#Preview {
    TaskDetailView(task: TaskModel(id: "", title: "", context: "", dueDate: 0, addedDate: 0, isDone: false))
}
