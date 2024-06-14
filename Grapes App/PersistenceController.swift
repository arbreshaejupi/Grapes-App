//
//  PersistenceController.swift
//  Grapes App
//
//  Created by arbresha ejupi on 14/06/2024.
//

import Foundation
import CoreData
import UIKit

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        // Add some sample data for previewing
        let grape1 = Grape(context: viewContext)
        grape1.id = UUID()
        grape1.name = "Chardonnay"
        grape1.grapeDescription = "Chardonnay is a green-skinned grape variety used in the production of white wine."
        grape1.image = UIImage(named: "chardonnay")?.jpegData(compressionQuality: 1.0)

        let grape2 = Grape(context: viewContext)
        grape2.id = UUID()
        grape2.name = "Merlot"
        grape2.grapeDescription = "Merlot is a dark blue-colored wine grape variety, used as both a blending grape and for varietal wines."
        grape2.image = UIImage(named: "merlot")?.jpegData(compressionQuality: 1.0)

        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "GrapesModel")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}

