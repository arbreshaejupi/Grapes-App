//
//  Grapes_AppApp.swift
//  Grapes App
//
//  Created by evlijana shehu on 01/06/2024.
//
import SwiftUI

@main
struct GrapesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        ViewControllerRepresentable()
            .edgesIgnoringSafeArea(.all) // Adjust as needed
    }
}

