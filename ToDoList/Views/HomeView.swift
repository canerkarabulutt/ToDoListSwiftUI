//
//  HomeView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View {
        TabView {
            TaskListView(userId: viewModel.currentUserId)
            .tabItem {
                Label("Home", systemImage: "house")
            }
            ProfileView()
            .tabItem {
                Label("Profile", systemImage: "person.circle")
            }
            ProfileView()
            .tabItem {
                Label("Past Tasks", systemImage: "clock.badge.checkmark")
            }
        }
        .accentColor(.green)
    }
}

#Preview {
    HomeView()
}

