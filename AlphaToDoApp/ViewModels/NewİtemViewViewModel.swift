//
//  NewİtemViewViewModel.swift
//  AlphaToDoApp
//
//  Created by Onur Anıl on 3.06.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewİtemViewViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init(){}
    
    //TARİH GİRİLEN DATALARI FİRESTORE KAYDETMEK İÇİN
    func save(){
        guard canSave else{
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let newItemId = UUID().uuidString
        let newItem = ToDoListİtem(id: newItemId,
                                    title: title,
                                    dueDate: dueDate.timeIntervalSince1970,
                                    createdDate: Date().timeIntervalSince1970,
                                    isDone: false)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictonary())
        
    }
    

    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        
        return true
        
    }
    
}
