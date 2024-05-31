//
//  ProfileViewModel.swift
//  ToDoList
//
//  Created by Caner Karabulut on 27.05.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    init() {}
    
    @Published var user: UserModel? = nil
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else { return }
            
            DispatchQueue.main.async {
                self?.user = UserModel(id: data["id"] as? String ?? "",
                                       name: data["name"] as? String ?? "",
                                       username: data["username"] as? String ?? "",
                                       email: data["email"] as? String ?? "",
                                       joined: data["joined"] as? TimeInterval ?? 0
                )
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
