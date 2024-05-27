//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
