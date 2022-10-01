//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Yosef Ben Zaken on 01/10/2022.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal: Animal
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}
