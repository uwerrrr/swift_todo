//
//  NewItemView.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    
    var body: some View {
        VStack{
            Text("New item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 60)
        
            Form{
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                TLButton(title: "Save", background: .pink){
                    viewModel.save()
                }
            }
        }
        
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView()
    }
}
