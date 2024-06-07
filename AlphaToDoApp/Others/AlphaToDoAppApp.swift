//
//  AlphaToDoAppApp.swift
//  AlphaToDoApp
//
//  Created by Onur Anıl on 3.06.2024.
//
import FirebaseCore
import SwiftUI

@main
struct AlphaToDoAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
