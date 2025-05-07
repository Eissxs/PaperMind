//
//  DocumentScannerViewModel.swift
//  PaperMind
//
//  Created by Michael Eissen San Antonio on 5/7/25.
//

import SwiftUI
import Vision
import UIKit

class DocumentScannerViewModel: ObservableObject {
    @Published var documents: [ScannedDocument] = []
    @Published var isProcessing: Bool = false

    func addDocument(image: UIImage) {
        isProcessing = true

        DispatchQueue.global(qos: .userInitiated).async {
            self.performOCR(on: image) { recognizedText in
                DispatchQueue.main.async {
                    let category = self.categorizeText(recognizedText)
                    let imageName = self.saveImageToDisk(image)

                    let newDocument = ScannedDocument(
                        id: UUID(),
                        imageName: imageName,
                        ocrText: recognizedText,
                        category: category,
                        date: Date()
                    )

                    self.documents.insert(newDocument, at: 0)
                    self.isProcessing = false
                }
            }
        }
    }

    // MARK: - OCR using Vision
    private func performOCR(on image: UIImage, completion: @escaping (String) -> Void) {
        guard let cgImage = image.cgImage else {
            completion("")
            return
        }

        let request = VNRecognizeTextRequest { request, error in
            guard let observations = request.results as? [VNRecognizedTextObservation], error == nil else {
                completion("")
                return
            }

            let text = observations
                .compactMap { $0.topCandidates(1).first?.string }
                .joined(separator: "\n")

            completion(text)
        }

        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true

        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        try? requestHandler.perform([request])
    }

    // MARK: - Enhanced Auto-Categorization
    private func categorizeText(_ text: String) -> DocumentCategory {
        let lowerText = text.lowercased()

        let urgentKeywords = ["asap", "important", "due", "quiz", "exam", "deadline", "payment", "bill", "invoice"]
        let laterKeywords = ["review", "reminder", "read", "notes", "meeting", "schedule", "event", "follow up"]

        if urgentKeywords.contains(where: { lowerText.contains($0) }) {
            return .urgent
        } else if laterKeywords.contains(where: { lowerText.contains($0) }) {
            return .later
        } else {
            return .trash
        }
    }

    // MARK: - Image Persistence
    private func saveImageToDisk(_ image: UIImage) -> String {
        let imageName = UUID().uuidString + ".jpg"
        let url = getDocumentsDirectory().appendingPathComponent(imageName)

        if let data = image.jpegData(compressionQuality: 0.8) {
            try? data.write(to: url)
        }

        return imageName
    }

    func loadImage(named name: String) -> UIImage? {
        let url = getDocumentsDirectory().appendingPathComponent(name)
        return UIImage(contentsOfFile: url.path)
    }

    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
