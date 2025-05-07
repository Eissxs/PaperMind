//
//  ScannedDocument.swift
//  PaperMind
//
//  Created by Michael Eissen San Antonio on 5/7/25.
//

import Foundation
import SwiftUI

enum DocumentCategory: String, Codable, CaseIterable {
    case urgent, later, trash

    var title: String {
        switch self {
        case .urgent: return "Urgent"
        case .later: return "Later"
        case .trash: return "Trash it!"
        }
    }

    var icon: String {
        switch self {
        case .urgent: return "flame.fill"
        case .later: return "hourglass"
        case .trash: return "trash.fill"
        }
    }
}

struct ScannedDocument: Identifiable, Codable, Equatable {
    let id: UUID
    let imageName: String
    let ocrText: String
    var category: DocumentCategory
    let date: Date
}
