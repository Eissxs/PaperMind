//
//  FolderCard.swift
//  PaperMind
//
//  Created by Michael Eissen San Antonio on 5/7/25.
//

import SwiftUI

struct FolderCard<Destination: View>: View {
    var category: DocumentCategory
    var count: Int
    @ViewBuilder var destination: () -> Destination

    @State private var isPressed = false
    @State private var navigate = false

    var body: some View {
        ZStack {
            NavigationLink(destination: destination(), isActive: $navigate) { EmptyView() }

            HStack(spacing: 16) {
                Image(systemName: category.icon)
                    .font(.system(size: 22))
                    .foregroundColor(.white)

                VStack(alignment: .leading, spacing: 4) {
                    Text(category.title)
                        .font(.callout.weight(.semibold))
                        .foregroundColor(.white)

                    if count > 0 {
                        Text("\(count) document\(count > 1 ? "s" : "")")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.8))
                    }
                }

                Spacer()

                if count > 0 {
                    Text("\(count)")
                        .font(.caption2.bold())
                        .padding(6)
                        .background(Color.white.opacity(0.2))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(Color(category))
            .cornerRadius(16)
            .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
            .scaleEffect(isPressed ? 0.96 : 1.0)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.1)) {
                    isPressed = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    isPressed = false
                    navigate = true
                }
            }
        }
    }
}
