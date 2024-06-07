//
//  ToDoListİtem.swift
//  AlphaToDoApp
//
//  Created by Onur Anıl on 3.06.2024.
//

import Foundation

struct ToDoListİtem: Codable, Identifiable{
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
    
}
