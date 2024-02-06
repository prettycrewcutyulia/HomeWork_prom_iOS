//
//  TodoList_with_CoreDataApp.swift
//  TodoList_with_CoreData
//
//  Created by Юлия Гудошникова on 06.02.2024.
//

import SwiftUI

@main
struct TodoList_with_CoreDataApp: App {
    let persistenceController = CoreDataManager.shared.persistentContainer

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}
