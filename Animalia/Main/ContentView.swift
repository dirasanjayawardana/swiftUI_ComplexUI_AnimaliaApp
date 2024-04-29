//
//  ContentView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Group {
                CoverImageView()
                    .frame(height: 300)
            }
            .navigationTitle("Animalia")
        }
    }
}

#Preview {
    ContentView()
}
