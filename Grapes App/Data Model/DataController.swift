//
//  DataController.swift
//  Grapes App
//
//  Created by arbresha ejupi on 14/06/2024.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "GrapesModel")
    
    init(){
        container.loadPersistentStores {desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved!!!")
        } catch {
            print("Data is not saved....")
        }
    }
    
    func addGrapes(name: String, image: Data, description: String, context: NSManagedObjectContext ){
        let grape = Grape(context: context)
        grape.id = UUID()
        grape.name = name
        grape.image = image
        grape.grapeDescription = description
        
        save(context: context)
    }
    
    func editGrape(grape: Grape, name: String, image: Data, description: String, context: NSManagedObjectContext){
        grape.name = name
        grape.grapeDescription = description
        grape.image = image
        
        save(context: context)
    }
    
    func deleteGrape(grape: Grape, context: NSManagedObjectContext) {
        context.delete(grape)
        save(context: context)
    }
}
