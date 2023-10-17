//
//  LoginViewViewModel.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    
    @Published var email = "" // ~ state in react
    @Published var password = ""
    @Published var errMess = ""
    
    init() {}
    
    // 2 ways to define functions:
        // func login() {}
        // let validate:() -> Void = {}
    
    func login() {
        // VALIDATION
        guard validate() else {
            return
        }
        
        // Try log in using firebase
        Auth.auth().signIn(withEmail: email, password: password)
        
        print("Logging in with email: \(email) and password: \(password)")
        
    }
    
    private func validate() -> Bool {
        errMess = ""
        
        // validate empty string
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errMess = "Email and password are required."
            return false
        }
        
        // validate email
        guard email.contains("@") && email.contains(".") else {
            errMess = "Please enter valid email."
            return false
        }
        
        return true
    }
    
    
    
}
