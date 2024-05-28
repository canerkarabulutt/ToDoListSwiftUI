//
//  UserModel.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import Foundation

struct UserModel: Codable {
    let id: String
    let name: String
    let username: String
    let email: String
    let joined: TimeInterval
}
