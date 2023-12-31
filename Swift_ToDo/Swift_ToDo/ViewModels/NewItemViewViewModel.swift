//
//  NewItemViewViewModel.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    // save function
    func save(){
        guard canSave else{
            return
        }
        
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false)
        
        
        // Save to firestore
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary()) // set data as a dictionary
    }
    
    var canSave:Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        // due date >= yesterday
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
        
    }
}
