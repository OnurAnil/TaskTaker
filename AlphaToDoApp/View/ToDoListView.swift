//
//  ToDoListView.swift
//  AlphaToDoApp
//
//  Created by Onur Anıl on 3.06.2024.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListİtem]
    
    
    init(userId:String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .background(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Tasks")
            .toolbar{
                Button{
                    //Sheet açma kodları
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItempresented: $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "QcveTXffBBZFkQN7xNLBc0QBBIx2")
}
