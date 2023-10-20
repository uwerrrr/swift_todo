//
//  RegisterView.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import SwiftUI

struct RegisterView: View {
    
    
    @StateObject var viewModel = RegisterViewViewModel()

    
    var body: some View {
        // main layout
        VStack{
            // Header
            HeaderView(title: "Registrer",
                       subtitle: "Register to get things done",
                       angle: -15,
                       background: .orange)
            
        
            
            // Registration form
            if viewModel.loading { Text("loading...")}
            else{
                Form{
                    TextField("Full Name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    TextField("Email address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Register",
                             background: .green){
                        // Attempt registration
                        viewModel.register()
                    }.padding()
                }
                .offset(y:-90)
            }
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
