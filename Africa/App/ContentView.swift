//
//  ContentView.swift
//  Africa
//
//  Created by Yosef Ben Zaken on 27/09/2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Variables
    let animals: [Animal] = Bundle.main.decode("Data/animals.json")
    
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                ForEach(animals) { animal in
                    NavigationLink {
                        AnimalDetailView(animal: animal)
                    } label: {
                        AnimalListItemView(animal: animal)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
