//
//  HeaderView.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack { // SwiftUI container: stacks its child views on top of each other, arranging them along the Z-axis
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.pink)
                .rotationEffect(Angle(degrees: 15))
          
            
            VStack{
                Text("To Do List")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.system(size: 50) // use system font, size 50.
                    )
                Text("Get things done")
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
            }
            .padding(.top,30)
        }
        . frame(
            width: UIScreen.main.bounds.width * 3
            // width = screen width * 3
            ,
            height: 300)
        
        .offset(y: -100) // move contatiner up
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
