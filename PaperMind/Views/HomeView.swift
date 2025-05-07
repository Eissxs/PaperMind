//
//  HomeView.swift
//  PaperMind
//
//  Created by Michael Eissen San Antonio on 5/7/25.
//

import SwiftUI
import PhotosUI

struct HomeView: View {
    @StateObject var viewModel = DocumentScannerViewModel()
    @State private var isImagePickerPresented = false
    @State private var isCameraPickerPresented = false
    @State private var capturedImage: UIImage?
    @State private var importPressed = false
    @State private var capturePressed = false
    @State private var animateBackground = false

    var body: some View {
        NavigationView {
            ZStack {
                // Gradient background
                LinearGradient(
                    gradient: Gradient(colors: [Color(.urgent).opacity(0.3), Color(.later).opacity(0.3)]),
                    startPoint: animateBackground ? .topLeading : .bottomTrailing,
                    endPoint: animateBackground ? .bottomTrailing : .topLeading
                )
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 4).repeatForever(autoreverses: true), value: animateBackground)

                ScrollView {
                    VStack(spacing: 28) {
                        Text("Folders")
                            .font(.title2.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)

                        ForEach(DocumentCategory.allCases, id: \.self) { category in
                            FolderCard(
                                category: category,
                                count: viewModel.documents.filter { $0.category == category }.count
                            ) {
                                FolderView(
                                    category: category,
                                    documents: $viewModel.documents,
                                    viewModel: viewModel
                                )
                            }
                            .padding(.horizontal)
                        }

                        HStack(spacing: 16) {
                            Button(action: {
                                withAnimation(.easeIn(duration: 0.1)) { importPressed = true }
                                HapticFeedback.light()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    importPressed = false
                                    isImagePickerPresented = true
                                }
                            }) {
                                Label("Import", systemImage: "photo")
                                    .font(.headline)
                                    .padding()
                                    .frame(width: 160, height: 60)
                                    .background(Color.paperGreen)
                                    .foregroundColor(.white)
                                    .cornerRadius(16)
                                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                                    .scaleEffect(importPressed ? 0.95 : 1.0)
                            }

                            Button(action: {
                                withAnimation(.easeIn(duration: 0.1)) { capturePressed = true }
                                HapticFeedback.light()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    capturePressed = false
                                    isCameraPickerPresented = true
                                }
                            }) {
                                Label("Capture", systemImage: "camera")
                                    .font(.headline)
                                    .padding()
                                    .frame(width: 160, height: 60)
                                    .background(Color.paperBlue)
                                    .foregroundColor(.white)
                                    .cornerRadius(16)
                                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                                    .scaleEffect(capturePressed ? 0.95 : 1.0)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top)
                    .padding(.bottom, 32)
                }
                .navigationTitle("PaperMind")
                .onAppear {
                    animateBackground = true
                }
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(image: $capturedImage, isPresented: $isImagePickerPresented)
                        .onDisappear {
                            if let image = capturedImage {
                                viewModel.addDocument(image: image)
                            }
                        }
                }
                .sheet(isPresented: $isCameraPickerPresented) {
                    CameraImagePicker(image: $capturedImage, isPresented: $isCameraPickerPresented)
                        .onDisappear {
                            if let image = capturedImage {
                                viewModel.addDocument(image: image)
                            }
                        }
                }
            }
        }
    }
}

// MARK: - Haptic Feedback Helper
struct HapticFeedback {
    static func light() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
}
