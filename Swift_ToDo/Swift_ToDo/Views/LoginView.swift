//
//  LoginView.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = "" // ~ state in react
    @State var password = ""
    
    var body: some View { // view's body: layout and content to be displayed
        NavigationView { // ~ BrowserRouter in React Router
            
            VStack{ // SwiftUI container: stacks its child views vertically
                
                // Header
                HeaderView()
                
                // Login Form
                Form{
                    TextField("Email Address", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    Button{
                        // Attempt log in
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                            
                            Text("Log in")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }
                    .padding()
                    
                    
                    
                }
                
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
