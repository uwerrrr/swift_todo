//
//  ToDoListView.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    @FirestoreQuery var items: [ToDoListItem] // list of TodoListItem
    
    init(userId: String) {
        // path to todo list in firestore users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos"
        )
    }
    
    var body: some View {
        NavigationView{
            VStack {
                List(items) { item in
                    Text(item.title)
                    
                }
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
                    .presentationDragIndicator(.visible)
            }
        
        }
    }
    
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "5gcgWCE1MDhp9QAf2IVcVn8IVyJ2")
    }
}
