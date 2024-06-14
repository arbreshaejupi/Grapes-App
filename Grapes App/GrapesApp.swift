//
//  GrapesApp.swift
//  Grapes App
//
//  Created by arbresha ejupi on 12/06/2024.
//

import SwiftUI

@main
struct GrapesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
