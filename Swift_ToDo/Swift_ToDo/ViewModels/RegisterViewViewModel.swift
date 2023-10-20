//
//  RegisterViewViewModel.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import FirebaseFirestore
import Foundation
import FirebaseAuth

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errMess = ""
    
    // when user hit register btn
    init(){}
    
    func register(){
        // validation
        guard validate() else {
            return
        }
        
        // Create a new user account with Firebase Authentication using the provided email and password.
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            // {result, error in ... } is similar to numbers.filter((number, index) => {})
            
            
            // Check if a user ID is present in the result. If not, exit.
            guard let userId = result?.user.uid else {
                return
            }
            
            // If a user ID is available, insert a user record using the ID.
            self?.insertUserRecord(id: userId)
        }

        
    }
    
    // store new user data in firestore
    private func insertUserRecord(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
     
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    
    private func validate() -> Bool{
        errMess = ""
        
        // empty string
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errMess = "Name, Email and password are required."
            return false
            
        }
        
        // eamail
        guard email.contains("@") && email.contains(".")
        else {
            errMess = "Please enter valid email."
            return false
        }
        
        // password
        guard password.count >= 6
        else {
            errMess = "Password must be at least 6 characters"
            return false
        }
         
        
        return true
    }
    
    
}
