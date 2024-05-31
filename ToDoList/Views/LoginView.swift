//
//  LoginView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(title: "To Do List", subtitle: "Manage your task easily!", angle: 30, background: .green)
                    .offset(y: -45)
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(Color.red)
                    }

                    TextField("Email...", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    SecureField("Password...", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                    
                    CustomButton(title: "Log In", background: .green) {
                        viewModel.login()
                    }
                    .padding(4)
                }
                .offset(y: -60)
                VStack {
                    Text("Log in to manage your tasks")
                    HStack {
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.gray)
                        Text("or")
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.gray)
                    }
                    NavigationLink("Click to Become a Member", destination: RegisterView())
                        .foregroundStyle(.green)
                }
                .padding(.bottom, 60)
                
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    LoginView()
}
