//
//  User.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 11/10/2023.
//

import Foundation

struct User: Codable {
    // Codable: this object can be easily encoding (converting) and decoding (parsing) data to and from various formats, such as JSON or Property Lists.
    
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
