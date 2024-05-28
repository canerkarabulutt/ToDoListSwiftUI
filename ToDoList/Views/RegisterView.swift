//
//  RegisterView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(title: "To Do List", subtitle: "Manage your task easily!", angle: 30, background: .green.opacity(0.5))
                    .offset(y: 21)
                Form {
                    TextField("Name...", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    TextField("Username...", text: $viewModel.username)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    TextField("Email...", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    SecureField("Password...", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                    
                    CustomButton(title: "Sign Up", background: .green.opacity(0.5)) {
                        viewModel.register()
                    }
                    .padding(4)
                }
                .offset(y: 35)
                VStack {
                    Text("If you are a member,")

                    NavigationLink("Click here to return to login page", destination: LoginView())
                        .foregroundStyle(.purple)
                }
                .padding(.bottom, 55)
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    RegisterView()
}
