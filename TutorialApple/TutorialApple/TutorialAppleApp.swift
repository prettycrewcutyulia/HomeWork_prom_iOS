//
//  TutorialAppleApp.swift
//  TutorialApple
//
//  Created by Юлия Гудошникова on 07.02.2024.
//

import SwiftUI

@main
struct TutorialAppleApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
