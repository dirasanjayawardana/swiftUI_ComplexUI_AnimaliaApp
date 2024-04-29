//
//  ContentView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI

struct ContentView: View {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    @State private var isGridVIewActive = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    let heptics = UIImpactFeedbackGenerator(style: .medium)
    
    func gridSwitch() {
        withAnimation(.easeIn) {
            gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
            gridColumn = gridLayout.count
        }
        
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    
    var body: some View {
        NavigationStack {
            Group {
                if isGridVIewActive {
                    ScrollView(showsIndicators: false, content: {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 16, content: {
                            ForEach(animals) { animal in
                                AnimalGridItemView(animal: animal)
                            }
                        })
                    })
                } else {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            .padding(.bottom, 12)
                        
                        ForEach(animals) {item in
                            AnimalListItemView(animal: item)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Animalia")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    HStack(spacing: 12) {
                        // MARK: - LIST
                        Button(action: {
                            isGridVIewActive = false
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(isGridVIewActive ? .white : .accent)
                        })
                        
                        // MARK: - GRID
                        Button(action: {
                            isGridVIewActive = true
                            gridSwitch()
                            heptics.impactOccurred()
                        }, label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundStyle(isGridVIewActive ? .accent : .white)
                        })
                    }
                })
            })
        }
    }
}

#Preview {
    ContentView()
}
