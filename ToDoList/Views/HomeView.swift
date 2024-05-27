//
//  HomeView.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            LoginView()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
