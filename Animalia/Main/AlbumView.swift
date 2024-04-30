//
//  AlbumView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 30/04/24.
//

import SwiftUI
import PhotosUI

struct AlbumView: View {
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImages: [UIImage] = []
    
    var body: some View {
        VStack {
            // MARK: Display Selected Images
            if selectedItems.isEmpty {
                ContentUnavailableView("No Photos", systemImage: "photo.on.rectangle", description: Text("To get started, select some photos below."))
                    .frame(height: 300)
            } else {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(selectedImages, id:\.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 250)
                                .clipShape(RoundedRectangle(cornerRadius: 24))
                                .padding(.horizontal, 20)
                                .containerRelativeFrame(.horizontal)
                        }
                    }
                }
                .frame(height: 300)
            }
            
            Spacer()
            
            PhotosPicker(selection: $selectedItems, maxSelectionCount: 5, selectionBehavior: .continuousAndOrdered, matching: .images) {
                Label("Select a photo", systemImage: "photo")
            }
            .photosPickerStyle(.inline)
            .frame(height: 500)
            .ignoresSafeArea()
            .onChange(of: selectedItems) { oldItems, newItems in
                
                print(oldItems.count)
                print(newItems.count)
                
                selectedImages = []
                
                newItems.forEach { newItem in
                    Task {
                        if let data = try? await newItem.loadTransferable(type: Data.self) {
                            if let image = UIImage(data: data) {
                                selectedImages.append(image)
                            }
                        }
                    }
                }
            }
        }
        
        // simple implementation
        // PhotosPicker(selection: $selectedItems, matching: .images) {
        //     Label("Select a photo", systemImage: "photo")
        // }
    }
}

#Preview {
    AlbumView()
}
