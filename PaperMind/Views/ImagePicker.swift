//
//  ImagePicker.swift
//  PaperMind
//
//  Created by Michael Eissen San Antonio on 5/7/25.
//

import SwiftUI
import PhotosUI

struct ImagePicker: View {
    @Binding var image: UIImage?
    @Binding var isPresented: Bool
    @State private var selectedItem: PhotosPickerItem?

    var body: some View {
        ZStack {
            // Soft animated gradient background
            LinearGradient(
                gradient: Gradient(colors: [Color(.urgent).opacity(0.3), Color(.later).opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 24) {
                Image(systemName: "photo.on.rectangle")
                    .font(.system(size: 48))
                    .foregroundColor(.primary.opacity(0.6))

                Text("Choose a Photo")
                    .font(.title2.bold())
                    .foregroundColor(.primary)

                PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                    Text("Select from Library")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.paperBlue)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                        .padding(.horizontal)
                }
            }
            .padding()
        }
        .onChange(of: selectedItem) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    image = uiImage
                    isPresented = false
                }
            }
        }
    }
}
