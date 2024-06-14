//
//  GrapeDetailView.swift
//  Grapes App
//
//  Created by arbresha ejupi on 12/06/2024.
//

import SwiftUI

struct GrapeDetailView: View {
    var grape: Grape
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var dataController = DataController()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let imageData = grape.image, let image = UIImage(data: imageData) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                }
                if let name = grape.name {
                    Text(name)
                        .font(.largeTitle)
                        .padding(.top, 16)
                }
                if let description = grape.grapeDescription {
                    Text(description)
                        .font(.body)
                        .padding(.top, 8)
                }
            }
            .padding()
        }
        .navigationBarTitle(Text(grape.name ?? ""), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            deleteGrape()
        }) {
            Image(systemName: "trash")
        })
    }

    private func deleteGrape() {
        dataController.deleteGrape(grape: grape, context: viewContext)
        presentationMode.wrappedValue.dismiss()
    }
}

struct GrapeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let grape = Grape(context: context)
        grape.name = "Chardonnay"
        grape.grapeDescription = "Chardonnay is a green-skinned grape variety used in the production of white wine."
        grape.image = UIImage(named: "chardonnay")?.jpegData(compressionQuality: 1.0)
        return GrapeDetailView(grape: grape)
    }
}
