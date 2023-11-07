//
//  ProfileViewViewModel.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewViewModel: ObservableObject {
    
    init() {}
    
    @Published var user: User? = nil
    
    func fetchUser(){
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .getDocument { [weak self] documentSnapshot, err in
                guard let data = documentSnapshot?.data(), err == nil
                else { return }
                
                DispatchQueue.main.async {
                    self?.user = User(
                        id: data["id"] as? String ?? "",
                        name: data["name"] as?  String ?? "",
                        email: data["email"] as?  String ?? "",
                        joined: data["joined"] as?  TimeInterval ?? 0)
                }
            }
    }
    
    func logOut() {

        do {
            try Auth.auth().signOut() // log out firestore auth func
        } catch {
            print(error)
        }
        
    }
    
}
