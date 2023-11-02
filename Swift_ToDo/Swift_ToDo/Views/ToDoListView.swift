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
                    // display NewItemView in sheet
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            // Show `NewItemView` in a sheet when `viewModel.showingNewItemView` stage is `true`.
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(showingNewItemView: $viewModel.showingNewItemView)
            }
        
        }
    }
    
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "test userID")
    }
}
