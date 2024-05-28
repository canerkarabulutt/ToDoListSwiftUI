//
//  RegisterView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name = ""
    @State var username = ""
    @State var email = ""
    @State var password = ""
    
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(title: "To Do List", subtitle: "Manage your task easily!", angle: 30, background: .purple)
                    .offset(y: 21)
                Form {
                    TextField("Name...", text: $name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    TextField("Username...", text: $username)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    TextField("Email...", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    SecureField("Password...", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                    
                    AuthButton(title: "Sign Up", background: .purple) {
                        
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
