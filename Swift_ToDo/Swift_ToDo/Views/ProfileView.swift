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
                Text("Welcome to your profile !")
                
                // Avatar
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.blue)
                    .frame(width:125, height: 125)
                
                // Info: Name, email, member since
                VStack(alignment: .leading){
                    HStack{
                        Text("Name: ")
                        Text("...")
                    }
                    HStack{
                        Text("Email: ")
                        Text("...")
                    }
                    HStack{
                        Text("Member since: ")
                        Text("...")
                    }
                }
                
                // sign out
            }
            .navigationTitle("Profile")
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
