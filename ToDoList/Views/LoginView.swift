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
                    .offset(y: 21)
                Form {
                    TextField("Email...", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    SecureField("Password...", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                    
                    AuthButton(title: "Log In", background: .green) {
                        
                    }
                    .padding(4)
                }
                .offset(y: 35)
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
