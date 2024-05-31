//
//  ProfileView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: UserModel) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(Color.green)
            .frame(width: UIScreen.main.bounds.width/2.5, height: UIScreen.main.bounds.width/2.5)
            .padding()
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Username: ")
                    .bold()
                Text(user.username)
            }
            .padding()
            HStack {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        CustomButton(title: "Sign Out", background: .green) {
            viewModel.logOut()
        }
        .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/8)
        Spacer()
    }
}

#Preview {
    ProfileView()
}
