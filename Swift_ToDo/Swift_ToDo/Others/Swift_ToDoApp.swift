//
//  Swift_ToDoApp.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import FirebaseCore
import SwiftUI

@main
struct Swift_ToDoApp: App {
    init() {
        FirebaseApp.configure()
        // initiately connect to firebase server with GoogleService-Info config file
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
