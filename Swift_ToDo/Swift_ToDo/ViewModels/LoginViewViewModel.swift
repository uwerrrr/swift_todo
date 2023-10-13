//
//  LoginViewViewModel.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = "" // ~ state in react
    @Published var password = ""
    
    init() {}
    
    // 2 ways to define functions:
        // func login() {}
        // let validate:() -> Void = {}
    
    func login() {}
    
    let validate:() -> Void = {}
    
    
}
