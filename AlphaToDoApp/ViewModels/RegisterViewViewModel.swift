//
//  RegisterViewViewModel.swift
//  AlphaToDoApp
//
//  Created by Onur Anıl on 3.06.2024.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func register(){
        guard validate() else{
            return
        }
        //Firebase e kullanıcı kayıt etme.
        Auth.auth().createUser(withEmail: email, password: password){ [weak self] result,
            error in
            guard let userId = result?.user.uid else{
                return
            }
            
            //insert metodu çağıralacak
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictonary())
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill in all fields!"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter a valid email address!"
            return false
        }
        
        guard password.count >= 6 else{
            errorMessage = "please set a password of 6 or more characters!"
            return false
        }
        
        return true
    }
    
}
