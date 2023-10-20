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
