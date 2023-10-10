//
//  Swift_ToDoApp.swift
//  Swift ToDo
//
//  Created by Van Nguyen on 10/10/2023.
//

import FirebaseCore
import SwiftUI

@main
struct Swift_ToDoApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct Previews_Swift_ToDoApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
