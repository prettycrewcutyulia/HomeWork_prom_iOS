//
//  ContentView.swift
//  TodoList_with_CoreData
//
//  Created by Юлия Гудошникова on 06.02.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var title: String = ""
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.id, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter task...", text: $title)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Save") {
                        saveTask()
                    }
                    .padding(10)
                    .background(.mint)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                }
                List {
                    
                    ForEach(items) { task in
                        HStack {
                            Circle()
                                .fill(.mint)
                                .frame(width: 15, height: 15)
                            Spacer().frame(width: 20)
                            Text(task.title ?? "")
                            Spacer()
                            Image(systemName: task.isDone ? "checkmark.circle.fill": "checkmark.circle")
                                .foregroundColor(.mint)
                                .onTapGesture {
                                    updateTask(task)
                                }
                        }
                    }.onDelete(perform: deleteTask)
                    
                }.padding(0).listStyle(PlainListStyle())
                
                
                Spacer()
            }
            .padding()
            .navigationTitle("All Tasks")
        }
    }
    
    private func saveTask() {
        do {
            let task = Item(context: viewContext)
            task.title = title
            task.id = UUID()
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
        title = ""
    }
    
    private func updateTask(_ task: Item) {
        
        task.isDone = !task.isDone
        
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
            let task = items[index]
            viewContext.delete(task)
            
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
