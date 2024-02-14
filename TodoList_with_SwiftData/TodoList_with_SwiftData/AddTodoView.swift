//
//  AddTodoView.swift
//  TodoList_with_SwiftData
//
//  Created by Юлия Гудошникова on 13.02.2024.
//

import SwiftUI

struct AddTodoView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var title : String
    @Binding var isPresented: Bool
    var body: some View {
        TextField("Title...", text: $title).frame(width: 200, height: 50, alignment: .center).padding().border(.black, width: 2).padding(40)
        HStack(alignment: .center, spacing: 10) {
            Button("OK") {
                addItem()
            }.padding().border(.black)
            Button("Cancel") {
                isPresented.toggle()
            }.padding().border(.black)
        }
    }
    private func addItem() {
        withAnimation {
            if (title != "") {
                let newItem = TodoItem(title: title, completed: false, timestamp: Date())
                modelContext.insert(newItem)
                title = ""
            }
        }
    }
}
