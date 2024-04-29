//
//  ExternalWebLinkView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI

struct ExternalWebLinkView: View {
    let animal: AnimalModel
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                
                Spacer()
                
                Group {
                    let destination = URL(string: animal.link)
                    let defaultDestination = URL(string: "https://wikipedia.org")!
                    
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (destination ?? defaultDestination))
                }
            }
        }
    }
}

#Preview {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    return ExternalWebLinkView(animal: animals[1])
}
