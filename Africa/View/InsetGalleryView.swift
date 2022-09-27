//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Yosef Ben Zaken on 27/09/2022.
//

import SwiftUI

struct InsetGalleryView: View {
    let animal: Animal
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(alignment: .center,spacing: 15) {
                ForEach(animal.gallery, id: \.self) {item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }
        }
    }
}
