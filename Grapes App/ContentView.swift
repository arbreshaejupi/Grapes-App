//
//  ContentView.swift
//  Grapes App
//
//  Created by arbresha ejupi on 12/06/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Grape.name, ascending: true)],
        animation: .default)
    private var grapes: FetchedResults<Grape>

    @State private var isPresentingAddGrapeView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(grapes) { grape in
                    NavigationLink(destination: GrapeDetailView(grape: grape)) {
                        GrapeCardView(grape: grape)
                            .padding(.vertical)
                    }
                }
                .onDelete(perform: deleteGrapes)
            }
            .navigationTitle("Grapes")
            .navigationBarItems(trailing: Button(action: {
                isPresentingAddGrapeView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $isPresentingAddGrapeView) {
                AddGrapeView()
                    .environment(\.managedObjectContext, viewContext)
            }
        }
    }

    private func deleteGrapes(offsets: IndexSet) {
        withAnimation {
            offsets.map { grapes[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

