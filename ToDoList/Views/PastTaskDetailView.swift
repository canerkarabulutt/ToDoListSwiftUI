//
//  PastTaskDetailView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 3.06.2024.
//

import SwiftUI

struct PastTaskDetailView: View {
    
    @State var task: TaskModel
    @StateObject var viewModel = TaskViewModel()
    @State private var isEditing = false

    var body: some View {
        VStack {
            DetailHeaderView(title: task.title, subtitle: "", angle: 0, background: .gray)
                .frame(width: UIScreen.main.bounds.width*2,height: UIScreen.main.bounds.height/12)
                .offset(y: -20)
            HStack {
                CustomButton(title: "Remove Permanently", background: .red) {
                    viewModel.updateTask(task: task)
                    isEditing.toggle()
                }
                .frame(width: UIScreen.main.bounds.width/2 ,height: UIScreen.main.bounds.width/8)
            }
            Spacer()
        }
        Spacer()
            Text(task.context)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
                .padding()
                .position(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/15)
                .foregroundStyle(Color(.secondaryLabel.withAlphaComponent(0.7)))
        Spacer()
    }
}

#Preview {
    PastTaskDetailView(task: TaskModel(id: "", title: "", context: "", dueDate: 0, addedDate: 0, isDone: false))
}
