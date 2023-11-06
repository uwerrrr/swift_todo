//
//  ToDoListViewViewModel.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import FirebaseFirestore
import Foundation

/// ViewModel for list of items view
/// Primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }

    func delete(id: String)  {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document("user_id")
            .collection("todos")
            .document(id)
            .delete()
        
    }
    
}
