//
//  AnimalDetailView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal: AnimalModel
    
    var body: some View {
        ScrollView(showsIndicators: false, content: {
            // Hero Image
            Image(animal.image)
                .resizable()
                .scaledToFit()
                .padding(.top)
            
            // Title
            Text(animal.name.uppercased())
                .font(.largeTitle)
                .fontWeight(.heavy)
                .background(Color.accent.frame(height: 8).offset(y: 28))
            
            // Headline
            Text(animal.headline)
                .font(.headline)
                .foregroundStyle(.accent)
                .padding()
            
            // Gallery
            Group {
                HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in picture")
                
                InsetGalleryView(animal: animal)
            }
            .padding(.vertical)
            
            // Fact
            Group {
                HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                
                InsetFactView(animal: animal)
            }
            .padding(.vertical)
            
            // Description
            Group {
                HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                
                Text(animal.description)
            }
            .padding()
            
            // Map
            Group {
                HeadingView(headingImage: "map", headingText: "National Parks")
                
            }
            .padding(.vertical)
        })
        .navigationTitle("Learn about \(animal.name)")
    }
}

#Preview {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    return NavigationStack{
        AnimalDetailView(animal: animals[1])
    }
}
