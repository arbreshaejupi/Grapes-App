//
//  GrapeCardView.swift
//  Grapes App
//
//  Created by arbresha ejupi on 12/06/2024.
//

import SwiftUI

struct GrapeCardView: View {
    var grape: Grape
    
    var body: some View {
        HStack {
            if let imageData = grape.image, let image = UIImage(data: imageData) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
                    .padding(.trailing, 8)
            }
            VStack(alignment: .leading) {
                if let name = grape.name {
                    Text(name)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
            }
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
    }
}

struct GrapeCardView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let grape = Grape(context: context)
        grape.name = "Chardonnay"
        grape.grapeDescription = "Chardonnay is a green-skinned grape variety used in the production of white wine."
        grape.image = UIImage(named: "chardonnay")?.jpegData(compressionQuality: 1.0)
        
        return GrapeCardView(grape: grape)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
