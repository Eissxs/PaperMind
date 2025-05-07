//
//  PaperMindApp.swift
//  PaperMind
//
//  Created by Michael Eissen San Antonio on 5/7/25.
//

import SwiftUI

@main
struct PaperMindApp: App {
    @State private var isActive = false

    var body: some Scene {
        WindowGroup {
            if isActive {
                HomeView()
                    .onAppear {
                        NotificationManager.shared.requestPermission()
                    }
            } else {
                SplashView(isActive: $isActive)
            }
        }
    }
}
