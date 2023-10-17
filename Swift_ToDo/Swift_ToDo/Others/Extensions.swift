//
//  Extensions.swift
//  Swift_ToDo
//
//  Created by Van Nguyen on 17/10/2023.
//

import Foundation

// add mehtods to Encodable object
extension Encodable{
    
    // convert an object to dictionary
    func asDictionary() -> [String: Any] {
        // try to encode the object into JSON data using JSONEncoder
        guard let data = try? JSONEncoder().encode(self) else {
            // guard can also be used to check if the binding is successful
            //  try?: if econding fail -> data = nil => from guard -> return [:]
            return [:] // empty dict if fail
        }
        
        // try to deserializes the JSON data into a dictionary [key(String) : value(Any)] using JSONSerialization
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            // as?: try to cast the result of JSONSerialization.jsonObject(with: data) to [String: Any] -> returns optional type
            return json ?? [:] // return json if not nil, otherwise, return [:]
        } catch {
            return [:]
        }
        
    }
}
