//
//  LoginView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView()
                    .offset(y: -50)
                Form {
                    TextField("Email...", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    SecureField("Password...", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.green.opacity(1.0))
                            Text("Log In")
                                .foregroundStyle(.white)
                                .bold()
                        }
                    }
                    .padding(2)
                }
                .offset(y: -100)
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
                .padding(.bottom, 24)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
