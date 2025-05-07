//
//  SplashView.swift
//  PaperMind
//
//  Created by Michael Eissen San Antonio on 5/7/25.
//

import SwiftUI

struct SplashView: View {
    @State private var animate = false
    @Binding var isActive: Bool

    var body: some View {
        ZStack {
            // Animated gradient background with the colors defined in the Color extension
            LinearGradient(gradient: Gradient(colors: [Color(.urgent), Color(.later)]), // Using the colors defined in the extension
                           startPoint: animate ? .topLeading : .bottomTrailing,
                           endPoint: animate ? .bottomTrailing : .topLeading)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animate)

            VStack(spacing: 16) {
                Image("PaperMindLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle()) // This will make the logo round
                    .shadow(radius: 10)

                Text("PaperMind")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .shadow(radius: 10)

                Text("Clear papers. Clear mind.")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.85))
                    .italic()
            }
            .opacity(animate ? 1 : 0)
            .scaleEffect(animate ? 1 : 0.8)
            .animation(.easeOut(duration: 1.2), value: animate)
        }
        .onAppear {
            animate = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isActive = true
            }
        }
    }
}
