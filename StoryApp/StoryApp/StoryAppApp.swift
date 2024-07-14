//
//  StoryAppApp.swift
//  StoryApp
//
//  Created by Shraboni Banerjee on 14/07/24.
//

import SwiftUI
import SwiftData

@main
struct StoryAppApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
              ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(sharedModelContainer)
    }
}
