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
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [.init(.flexible())]
    @State private var gridCol: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    func gridSwitch() {
        withAnimation(.easeIn) {
            gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
            gridCol = gridLayout.count
        }
        
        switch gridCol {
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
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
                        CreditsView()
                            .modifier(CenterModifier())
                    }
                    .listStyle(.plain)

                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink {
                                    AnimalDetailView(animal: animal)
                                } label: {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button {
                            // List View
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        Button {
                            // Grid View
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
