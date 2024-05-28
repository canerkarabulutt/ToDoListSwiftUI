//
//  NewTaskView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import SwiftUI

struct NewTaskView: View {
    
    @StateObject var viewModel = NewTaskViewModel()
    
    var body: some View {
        VStack {
            Text("New Task")
                .font(.system(size: 32))
                .bold()
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                CustomButton(title: "Save", background: .green) {
                    viewModel.save()
                }
                .padding()
            }
        }
    }
}

#Preview {
    NewTaskView()
}
