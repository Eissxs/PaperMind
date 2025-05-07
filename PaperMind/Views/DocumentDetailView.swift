//
//  DocumentDetailView.swift
//  PaperMind
//
//  Created by Michael Eissen San Antonio on 5/7/25.
//

import SwiftUI

struct DocumentDetailView: View {
    var document: ScannedDocument
    var image: UIImage?

    @State private var animateBackground = false
    @State private var showCopiedAlert = false
    @State private var showFullScreenImage = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(.urgent).opacity(0.3), Color(.later).opacity(0.3)]),
                startPoint: animateBackground ? .topLeading : .bottomTrailing,
                endPoint: animateBackground ? .bottomTrailing : .topLeading
            )
            .ignoresSafeArea()
            .animation(.easeInOut(duration: 4).repeatForever(autoreverses: true), value: animateBackground)

            VStack {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .padding()
                        .onTapGesture {
                            showFullScreenImage = true
                        }

                    if !document.ocrText.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            Text(document.ocrText)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(10)

                            Button {
                                UIPasteboard.general.string = document.ocrText
                                showCopiedAlert = true
                            } label: {
                                Label("Copy Text", systemImage: "doc.on.doc")
                                    .font(.subheadline.bold())
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.accentColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                } else {
                    Text("No Image Available").foregroundColor(.gray)
                }
            }
        }
        .fullScreenCover(isPresented: $showFullScreenImage) {
            if let image = image {
                ZoomableImageView(image: image)
            }
        }
        .onAppear { animateBackground = true }
        .navigationTitle("Document Details")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Copied to Clipboard", isPresented: $showCopiedAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}
