//
//  HeaderView.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack { // SwiftUI container: stacks its child views on top of each other, arranging them along the Z-axis
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle)) // rotation
          
            
            VStack{
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.system(size: 50) // use system font, size 50.
                    )
                Text(subtitle)
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
            }
            .padding(.top,50)
        }
        . frame(
            width: UIScreen.main.bounds.width * 3
            // width = screen width * 3
            ,
            height: 350)
        
        .offset(y: -150) // move contatiner up
        
    
    
    }
    

}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title",
                   subtitle: "Subtitle",
                   angle: 15,
                   background: .blue)
    }
}
