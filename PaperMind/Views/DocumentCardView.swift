//
//  DocumentCardView.swift
//  PaperMind
//
//  Created by Michael Eissen San Antonio on 5/7/25.
//

import SwiftUI

struct DocumentCardView: View {
    var document: ScannedDocument
    var image: UIImage?
    var onDelete: () -> Void
    var onReassign: (DocumentCategory) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 12) {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipped()
                        .cornerRadius(12)
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text(document.ocrText.prefix(100))
                        .font(.subheadline)
                        .foregroundColor(.primary)

                    Text(document.date.formatted(date: .abbreviated, time: .shortened))
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                Spacer()
            }

            Divider().padding(.horizontal, -8)

            HStack {
                Label(document.category.title, systemImage: document.category.icon)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color(document.category).opacity(0.2))
                    .cornerRadius(10)

                Spacer()

                Menu {
                    ForEach(DocumentCategory.allCases, id: \.self) { category in
                        Button {
                            onReassign(category)
                        } label: {
                            Label(category.title, systemImage: category.icon)
                        }
                    }

                    Divider()

                    Button(role: .destructive) {
                        onDelete()
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }

                } label: {
                    Image(systemName: "ellipsis.circle")
                        .font(.title3)
                        .padding(.horizontal, 4)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.15), radius: 5, x: 0, y: 3)
        .padding(.horizontal)
        .padding(.top, 6)
        .transition(.move(edge: .bottom).combined(with: .opacity))
        .animation(.easeInOut, value: document)
    }
}
