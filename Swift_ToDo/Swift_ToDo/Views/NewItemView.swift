//
//  NewItemView.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var showingNewItemView: Bool // binding the showingNewItemView variable from parent view (ToDoListView)
    
    
    var body: some View {
        VStack{
            
            Text("New item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 40)
        
            Form{
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                TLButton(title: "Save", background: .pink){
                    if viewModel.canSave {
                        viewModel.save()
                        showingNewItemView = false
                    } else{
                        // Alert
                        viewModel.showAlert = true
                        
                    }
                 
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select a due date that is today or newer."))
            }
        }
        
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(showingNewItemView: Binding(get:{return true}, set: { _ in
            
        }))
    }
}
