//
//  AddGrapeView.swift
//  Grapes App
//
//  Created by arbresha ejupi on 13/06/2024.
//

import SwiftUI

struct AddGrapeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    @State private var name: String = ""
    @State private var grapeDescription: String = ""
    @State private var selectedImage: UIImage? = nil
    @State private var showImagePicker = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Grape Information")) {
                    TextField("Name", text: $name)
                    TextField("Description", text: $grapeDescription)
                    Button(action: {
                        showImagePicker = true
                    }) {
                        Text("Select Image")
                    }
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                }
            }
            .navigationBarTitle("Add New Grape", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                if let selectedImage = selectedImage {
                    let imageData = selectedImage.jpegData(compressionQuality: 1.0)!
                    let dataController = DataController()
                    dataController.addGrapes(name: name, image: imageData, description: grapeDescription, context: viewContext)
                    presentationMode.wrappedValue.dismiss()
                }
            })
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $selectedImage)
            }
        }
    }
}

struct AddGrapeView_Previews: PreviewProvider {
    static var previews: some View {
        AddGrapeView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}



