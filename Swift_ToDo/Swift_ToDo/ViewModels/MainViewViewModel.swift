//
//  MainViewViewModel.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        // Initialize class properties.
        // Set up a state change listener for user authentication.
        // Use `[weak self]` to capture self as a weak reference to prevent retain cycles.

        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async { //excecute the code block on the main queue/thread (desgined for handling UI updates) asynchronously
                // Update the current user ID when authentication state changes.
                // Safely unwrap the user's UID or use an empty string if it's nil.
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }


    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
        // if there is a currentUser in auth() -> true for isSignedIn
    }
    
}
