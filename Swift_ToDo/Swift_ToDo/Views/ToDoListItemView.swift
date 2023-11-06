//
//  ToDoListItemView.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//
// item component in the ToDo List

import SwiftUI

struct ToDoListItemView: View {
    let item: ToDoListItem
    @StateObject var viewModel = ToDoListItemViewViewModel()
    
    
    var body: some View {
        HStack {
            VStack(alignment:.leading){
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(id: "123",
                                    title: "Get milk",
                                    dueDate: Date().timeIntervalSince1970,
                                    createdDate: Date().timeIntervalSince1970,
                                    isDone: false))
    }
}
