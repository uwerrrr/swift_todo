//
//  LoginView.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import SwiftUI

struct LoginView: View {
    
   @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View { // view's body: layout and content to be displayed
        NavigationView { // ~ BrowserRouter in React Router
            
            VStack{ // SwiftUI container: stacks its child views vertically
                
                // Header
                HeaderView(title: "Swift ToDo",
                           subtitle: "Get things done",
                           angle: 15,
                           background: .pink)
                
                // Login Form
             
                
                
                Form{
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLButton(title: "Log in",
                             background: .blue){
                        // Attempt log in
                        viewModel.login()
                    }
                    
                    if !viewModel.errMess.isEmpty {
                        Text(viewModel.errMess).foregroundColor(Color.red)
                    }
                }.offset(y:-50)
                
                // Create Account
                VStack{
                    Text("New around here?")
                    NavigationLink("Create an account",destination: RegisterView()) // ~ Link in React Router
                }
                .padding(.bottom, 0)
                

                Spacer() // flexible empty space
                 
            }
        }
 
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
