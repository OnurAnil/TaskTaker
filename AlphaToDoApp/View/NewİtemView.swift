//
//  NewİtemView.swift
//  AlphaToDoApp
//
//  Created by Onur Anıl on 3.06.2024.
//

import SwiftUI

struct NewItemView: View {
    
    @Binding var newItempresented: Bool
    @StateObject var viewModel = NewİtemViewViewModel()
    
    var body: some View {
        VStack{
            Text("New Task")
                .font(.title)
                .bold()
                .padding(.top, 50)
            Form{
                TextField("Title", text: $viewModel.title)
                DatePicker("End Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                BigButton(title: "Save"){
                    if viewModel.canSave{
                        viewModel.save()
                        newItempresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
            }
            
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error!")
                , message: Text("Please check that the data is correct."))
            })
            
        }
    }
}

#Preview {
    NewItemView(newItempresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
