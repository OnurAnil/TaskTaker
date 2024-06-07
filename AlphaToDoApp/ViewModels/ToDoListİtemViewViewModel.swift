//
//  ToDoListİtemViewViewModel.swift
//  AlphaToDoApp
//
//  Created by Onur Anıl on 3.06.2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject{
    
    init(){}
    
    func toggleIsDone(item: ToDoListİtem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(item.id)
            .setData(itemCopy.asDictonary())
        
    }
    
}
