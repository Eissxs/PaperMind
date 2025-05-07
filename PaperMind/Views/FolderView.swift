//
//  FolderView.swift
//  PaperMind
//
//  Created by Michael Eissen San Antonio on 5/7/25.
//

import SwiftUI

struct FolderView: View {
    let category: DocumentCategory
    @Binding var documents: [ScannedDocument]
    var viewModel: DocumentScannerViewModel

    @State private var showingDeleteConfirmation = false
    @State private var documentToDelete: ScannedDocument?
    @State private var selectedDocument: ScannedDocument?
    @State private var animateBackground = false
    @State private var showBanner = false

    var body: some View {
        ZStack {
            // Animated Gradient Background
            LinearGradient(
                gradient: Gradient(colors: [Color(.urgent).opacity(0.3), Color(.later).opacity(0.3)]),
                startPoint: animateBackground ? .topLeading : .bottomTrailing,
                endPoint: animateBackground ? .bottomTrailing : .topLeading
            )
            .ignoresSafeArea()
            .animation(.easeInOut(duration: 4).repeatForever(autoreverses: true), value: animateBackground)

            VStack {
                // Folder Header
                HStack {
                    Text(headerTitle(for: category))
                        .font(.title3)
                        .foregroundColor(Color(category))
                        .padding(.leading, 16)

                    Spacer()

                    Image(systemName: category.icon)
                        .font(.title2)
                        .foregroundColor(Color(category))
                        .padding(.trailing, 16)
                }
                .padding(.top, 16)

                // Document list
                ScrollView {
                    let filteredDocuments = documents.filter { $0.category == category }

                    VStack(spacing: 12) {
                        if filteredDocuments.isEmpty {
                            VStack {
                                Image(systemName: "tray")
                                    .font(.largeTitle)
                                    .foregroundColor(.gray)
                                Text("No documents yet.")
                                    .foregroundColor(.gray)
                            }
                            .padding(.top, 50)
                        } else {
                            ForEach(filteredDocuments) { doc in
                                DocumentCardView(
                                    document: doc,
                                    image: viewModel.loadImage(named: doc.imageName),
                                    onDelete: {
                                        documentToDelete = doc
                                        showingDeleteConfirmation.toggle()
                                    },
                                    onReassign: { newCategory in
                                        reassignCategory(of: doc, to: newCategory)
                                    }
                                )
                                .onTapGesture {
                                    withAnimation {
                                        selectedDocument = doc
                                    }
                                }
                                .swipeActions {
                                    Button(role: .destructive) {
                                        documentToDelete = doc
                                        showingDeleteConfirmation.toggle()
                                    } label: {
                                        Label("Delete", systemImage: "trash.fill")
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .alert(isPresented: $showingDeleteConfirmation) {
                Alert(
                    title: Text("Delete Document?"),
                    message: Text("Are you sure you want to delete this document?"),
                    primaryButton: .destructive(Text("Delete")) {
                        if let docToDelete = documentToDelete {
                            deleteDocument(docToDelete)
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
            .navigationTitle(category.title)

            // Inline banner
            if showBanner {
                VStack {
                    HStack {
                        Spacer()
                        Label("Category updated!", systemImage: "checkmark.circle.fill")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color(.urgent), Color(.later)]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .shadow(radius: 6)
                            )
                        Spacer()
                    }
                    .padding(.top, 60)
                    Spacer()
                }
                .transition(.move(edge: .top).combined(with: .opacity))
                .animation(.easeInOut(duration: 0.3), value: showBanner)
            }

            // Custom overlay for document detail
            if let doc = selectedDocument {
                ZStack {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                selectedDocument = nil
                            }
                        }

                    DocumentDetailView(document: doc, image: viewModel.loadImage(named: doc.imageName))
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                        .shadow(radius: 12)
                        .transition(.scale.combined(with: .opacity))
                }
                .animation(.easeInOut(duration: 0.3), value: selectedDocument)
            }
        }
        .onAppear {
            animateBackground = true
        }
    }

    // MARK: - Helper Methods

    private func reassignCategory(of document: ScannedDocument, to newCategory: DocumentCategory) {
        if let index = documents.firstIndex(where: { $0.id == document.id }) {
            documents[index].category = newCategory
            HapticFeedback.light()
            withAnimation {
                showBanner = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showBanner = false
                }
            }
        }
    }

    private func deleteDocument(_ document: ScannedDocument) {
        if let index = documents.firstIndex(where: { $0.id == document.id }) {
            documents.remove(at: index)
        }
    }

    private func headerTitle(for category: DocumentCategory) -> String {
        switch category {
        case .urgent:
            return "Needs your attention right away."
        case .later:
            return "Can be reviewed or handled at another time."
        case .trash:
            return "Not important—safe to delete."
        }
    }
}
