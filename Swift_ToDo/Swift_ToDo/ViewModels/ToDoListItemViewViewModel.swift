//
//  ToDoListItemViewViewModel.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

/// ViewModel for a single to-do item view (each row in the to-do list)
class ToDoListItemViewViewModel: ObservableObject {
   
    init() {}
    
    func toggleIsDone(item: ToDoListItem){
        var updatedItem = item
        updatedItem.isDone.toggle()

        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }

        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(item.id)
            .setData(updatedItem.asDictionary())
    }
    

}
