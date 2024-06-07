//
//  HeaderView.swift
//  AlphaToDoApp
//
//  Created by Onur Anıl on 3.06.2024.
//

import SwiftUI
import PhotosUI

struct HeaderView: View {

    var body: some View {
 
        ZStack{
            Image("Logo")
                .resizable()
                .frame(width: 150, height: 150)
            Text("TaskTaker")
                .font(.system(size: 60))
                .fontWeight(.bold)
                .padding(.top, 30)
                .foregroundStyle(.pink)
        }.padding(.top, 50)
    }
}

#Preview {
    HeaderView()
}
