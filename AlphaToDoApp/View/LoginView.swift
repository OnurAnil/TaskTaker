//
//  LoginView.swift
//  AlphaToDoApp
//
//  Created by Onur Anıl on 3.06.2024.
//

import SwiftUI
import SplineRuntime


struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
            NavigationStack{
                VStack{
                    // HEADAR
                    HeaderView()
                    
                    // form - Email, Şifre ve button
                        .frame(height: 230)
                    Form{
                        if !viewModel.errorMessage.isEmpty{
                            Text(viewModel.errorMessage)
                                .foregroundStyle(.red)
                        }
                        TextField("Email", text: $viewModel.email)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                        SecureField("Password", text: $viewModel.password)
                    }
                    .frame(height: 180)
                    
                    //BUTTON
                    BigButton(title: "SingIn", action: {viewModel.login()})
                    Spacer()
                    
                    //3D
                    Avatar3D()
                        .ignoresSafeArea(.all)
                    
                    
                    // Footer - hesabınız yok mu?
                    VStack{
                        Text("Are you new here?")
                        NavigationLink("SingUp", destination: RegisterView())
                    }
                    .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    LoginView()
}

struct Avatar3D: View {
    var body: some View {
        // fetching from cloud
        let url = URL(string: "https://build.spline.design/0gS1oELtK73OqDx20T88/scene.splineswift")!

        // // fetching from local
        // let url = Bundle.main.url(forResource: "scene", withExtension: "splineswift")!

        try? SplineView(sceneFileURL: url)
    }
}
