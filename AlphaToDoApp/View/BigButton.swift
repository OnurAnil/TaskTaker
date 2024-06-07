//
//  BigButton.swift
//  AlphaToDoApp
//
//  Created by Onur Anıl on 3.06.2024.
//

import SwiftUI

struct BigButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
             ZStack {
                 RoundedRectangle(cornerRadius: 5)
                     .foregroundStyle(.pink)
                 Text(title)
                     .foregroundStyle(.white)
             }
         })
        .frame(height: 50)
        .padding(.horizontal)
    }
}

#Preview {
    BigButton(title: "String", action: {})
}
