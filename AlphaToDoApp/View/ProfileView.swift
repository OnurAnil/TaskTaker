//
//  ProfileView.swift
//  AlphaToDoApp
//
//  Created by Onur Anıl on 3.06.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfilViewViewModel()
    
    init(){}
    
    var body: some View {
        NavigationView{
            VStack{
                
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Profile Loading...")
                }
                
                //logout işlemi
                BigButton(title:"Logout"){
                    viewModel.logout()
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.pink)
            .frame(width: 125, height: 125)
        
        VStack{
            HStack{
                Text("Name:")
                Text(user.name)
            }
            HStack{
                Text("email:")
                Text(user.email)
            }
            HStack{
                Text("date of registration")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
    }
    
}

#Preview {
    ProfileView()
}
