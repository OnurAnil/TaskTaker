//
//  ContentView.swift
//  AlphaToDoApp
//
//  Created by Onur Anıl on 3.06.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignIn,
           !viewModel.currentUserId.isEmpty{
            accountView
        }else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View{
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Tasks", systemImage: "house")
            }
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.circle")
            }
        }
    }
}

#Preview {
    MainView()
}




