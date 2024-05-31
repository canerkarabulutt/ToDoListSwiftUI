//
//  TaskDetailView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 30.05.2024.
//

import SwiftUI

struct TaskDetailView: View {
    
    @State var input = ""
    @State var task: TaskDetailModel
    @StateObject var viewModel = TaskDetailViewModel()

    var body: some View {
        VStack {
            HeaderView(title: task.title, subtitle: "", angle: 0, background: .green)
                .frame(height: UIScreen.main.bounds.width/5)
                .offset(y: -35)
            ZStack {
                
            }
            Form {

                
                CustomButton(title: "Save", background: .green) {
                    task.context = input
                    viewModel.updateTask(task: task)
                }
                .frame(height: UIScreen.main.bounds.width/8)
            }
            .padding(.bottom, 10)
            Spacer()
        }
        .onAppear {
            self.input = task.context
        }
    }
}

#Preview {
    TaskDetailView(task: TaskDetailModel(id: "", title: "", context: "", dueDate: 0, addedDate: 0))
}


/*                TextField("Details...", text: $input)
 .multilineTextAlignment(.leading)
 .textFieldStyle(DefaultTextFieldStyle())
 .textInputAutocapitalization(.never)
 .autocorrectionDisabled()
 .frame(height: UIScreen.main.bounds.width/1.2)
 .padding(4)*/
