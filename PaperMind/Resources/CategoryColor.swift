//
//  CategoryColor.swift
//  PaperMind
//
//  Created by Michael Eissen San Antonio on 5/7/25.
//

import SwiftUI

extension Color {
    init(_ category: DocumentCategory) {
        switch category {
        case .urgent: self = Color(red: 1.0, green: 0.42, blue: 0.42) // #FF6B6B
        case .later:  self = Color(red: 1.0, green: 0.82, blue: 0.4)  // #FFD166
        case .trash:  self = Color(red: 0.69, green: 0.74, blue: 0.77) // #B0BEC5
        }
    }

    // MARK: - Additional Theme Colors
    static let paperBlue = Color(red: 0.38, green: 0.71, blue: 0.98)   // #61B5FA (splash blue)
    static let paperGreen = Color(red: 0.46, green: 0.85, blue: 0.57)  // #75D992 (splash green)
}
