//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Yosef Ben Zaken on 30/09/2022.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    func randoCoordinate(max: CGFloat) -> CGFloat {
        CGFloat.random(in: 0...max)
    }
    
    func randomSize() -> CGFloat {
        CGFloat.random(in: 10...300)
    }
    
    func randomScale() -> CGFloat {
        CGFloat.random(in: 0.1...2.0)
    }
    
    func randomSpeed() -> Double {
        Double.random(in: 0.025...1.0)
    }
    
    func randomDelay() -> Double {
        Double.random(in: 0...2)
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(0...randomCircle, id: \.self) {item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randoCoordinate(max: geo.size.width),
                            y: randoCoordinate(max: geo.size.height)
                        )
                        .onAppear {
                            withAnimation(.interpolatingSpring(stiffness: 0.5, damping: 0.5).repeatForever().speed(randomSpeed()).delay(randomDelay())) {
                                isAnimating = true
                            }
                        }
                }
            }
            .drawingGroup()
        }
    }
}
