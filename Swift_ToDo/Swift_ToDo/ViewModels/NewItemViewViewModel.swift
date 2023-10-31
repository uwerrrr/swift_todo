//
//  NewItemViewViewModel.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    
    init() {}
    
    func save(){
        
    }
}
