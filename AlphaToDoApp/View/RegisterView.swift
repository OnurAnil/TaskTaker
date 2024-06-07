//
//  RegisterView.swift
//  AlphaToDoApp
//
//  Created by Onur Anıl on 3.06.2024.
//

import SwiftUI
import SplineRuntime

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                //HEADER
                Onboard3DView()
                    .frame(height: 550)
                    .ignoresSafeArea()
                
                //REGİSTER FORMU
                Form{
                    Section(header: Text("Register Form")) {
                        
                        if !viewModel.errorMessage.isEmpty{
                            Text(viewModel.errorMessage)
                                .foregroundStyle(.red)
                        }
                        
                        TextField("Full Name", text:$viewModel.name)
                            .autocorrectionDisabled()
                        TextField("E-mail", text: $viewModel.email)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                        SecureField("Password", text: $viewModel.password)
                    }
                }
                .frame(height: 225)
                
                BigButton(title: "Create", action: {viewModel.register()})
                Spacer()
                    .frame(height: 100)
                
            }
        }
    }
}

#Preview {
    RegisterView()
}
struct Onboard3DView: View {
    var body: some View {
        let url = URL(string:"https://build.spline.design/2v5D4Exk4Hu-nW0rtfRv/scene.splineswift")!

        // // fetching from local
        // let url = Bundle.main.url(forResource: "scene", withExtension: "splineswift")!

        try? SplineView(sceneFileURL: url)
        
    }
}
