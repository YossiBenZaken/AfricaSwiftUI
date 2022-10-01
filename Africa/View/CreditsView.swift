//
//  CreditsView.swift
//  Africa
//
//  Created by Yosef Ben Zaken on 01/10/2022.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
Copyright © Yossi Ben Zaken
All right reserved
Better Apps ♡ Less Code
""")
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}
