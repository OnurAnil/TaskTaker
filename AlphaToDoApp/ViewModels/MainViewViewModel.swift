//
//  MainViewViewModel.swift
//  AlphaToDoApp
//
//  Created by Onur Anıl on 3.06.2024.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject{
    @Published var currentUserId: String = ""
    
    init(){
        
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignIn: Bool {
        return Auth.auth().currentUser != nil
    }
    
}
