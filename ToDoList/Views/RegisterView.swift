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
                HeaderView(title: "To Do List", subtitle: "Manage your task easily!", angle: 30, background: .green.opacity(0.7))
                    .offset(y: -55)
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
                    
                    CustomButton(title: "Sign Up", background: .green.opacity(0.7)) {
                        viewModel.register()
                    }
                    .padding(4)
                }
                .offset(y: -80)
                VStack {
                    Text("If you are a member,")
                        .offset(y: -30)

                    NavigationLink("Click here to return to login page", destination: LoginView())
                        .foregroundStyle(.green)
                        .offset(y: -30)
                }
                .padding(.bottom, 30)
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    RegisterView()
}
