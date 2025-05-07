//
//  ZoomableImageView.swift
//  PaperMind
//
//  Created by Michael Eissen San Antonio on 5/7/25.
//

import SwiftUI

struct ZoomableImageView: View {
    var image: UIImage
    @Environment(\.dismiss) var dismiss

    @State private var scale: CGFloat = 1.0

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .scaleEffect(scale)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in scale = value }
                )
                .onTapGesture {
                    dismiss()
                }
        }
    }
}
