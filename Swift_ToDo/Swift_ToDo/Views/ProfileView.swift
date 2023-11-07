//
//  ProfileView.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        
        NavigationView{
            VStack {
                
                if let user = viewModel.user {
                    loadProfileView(user: user)
                    
                } else {
                    Text("Loading...")
                }
                
            
            }
            .navigationTitle("Profile")
         
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func loadProfileView(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width:125, height: 125)
            .padding()
        
        // Info: Name, email, member since
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            } .padding()
      
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            } .padding()
     
            HStack{
                Text("Member since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")

            } .padding()
        }

        // Log out 
        TLButton(title: "Log Out", background: .red) {
            viewModel.logOut()
        }
        
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
