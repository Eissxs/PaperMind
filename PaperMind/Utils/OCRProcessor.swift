//
//  OCRProcessor.swift
//  PaperMind
//
//  Created by Michael Eissen San Antonio on 5/7/25.
//

import Vision
import UIKit

struct OCRProcessor {
    static func recognizeText(from image: UIImage, completion: @escaping (String) -> Void) {
        guard let cgImage = image.cgImage else { completion(""); return }

        let request = VNRecognizeTextRequest { request, _ in
            let text = request.results?
                .compactMap { ($0 as? VNRecognizedTextObservation)?.topCandidates(1).first?.string }
                .joined(separator: "\n") ?? ""
            completion(text)
        }

        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        try? handler.perform([request])
    }
}
