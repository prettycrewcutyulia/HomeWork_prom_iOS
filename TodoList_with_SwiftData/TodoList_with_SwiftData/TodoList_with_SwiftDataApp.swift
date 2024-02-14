//
//  TodoList_with_SwiftDataApp.swift
//  TodoList_with_SwiftData
//
//  Created by Юлия Гудошникова on 13.02.2024.
//

import SwiftUI
import SwiftData

@main
struct TestBedApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            TodoItem.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            return container
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TabMainView()
        }
        .modelContainer(sharedModelContainer)
    }
}
