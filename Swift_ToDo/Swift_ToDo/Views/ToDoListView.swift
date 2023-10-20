//
//  ToDoListView.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel = ToDoListViewViewModel()
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Welcome to your account !")
            }
            .navigationTitle("To-Do List")
            .toolbar{
                Button {
                    // add new to-do item
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "")
    }
}
