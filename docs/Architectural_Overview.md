## Architectural Overview – PaperMind

*PaperMind* adopts the *MVVM (Model-View-ViewModel)* architecture to provide clear separation of concerns, offline-first functionality, and a maintainable SwiftUI codebase optimized for rapid prototyping with built-in OCR and categorization.

---

### Layers Overview

<img width="313" alt="Screenshot 2025-05-10 at 1 51 16 PM" src="https://github.com/user-attachments/assets/e1c84ac5-ba1e-4378-a86f-dce39dec2a40" />

---

### File Structure Breakdown

#### Models (Models/)

- *ScannedDocument.swift*: Represents a document with properties such as image path, extracted text, assigned folder, and timestamp. Conforms to Codable for local storage.

#### ViewModels (ViewModels/)

- *DocumentScannerViewModel.swift*: The primary business logic handler that manages scanned documents, triggers OCR processing, and performs automatic folder categorization.

#### Views (Views/)

- *HomeView.swift*: Main entrypoint that displays folder categories (Urgent, Later, Trash) and navigates to their respective document lists.
- *FolderView.swift*: Shows the list of documents filtered by category, along with swipe gestures for reassignment or deletion.
- *DocumentCardView.swift*: Visual preview of a scanned document used within folder lists.
- *DocumentDetailView.swift*: Fullscreen preview with zoomable image and text overlay.
- *ZoomableImageView.swift*: Enables pinch-to-zoom and panning for image previews.
- *CameraImagePicker.swift / ImagePicker.swift*: Custom wrappers for UIImagePickerController or PHPickerViewController, used for camera capture and gallery import.
- *SplashView.swift*: Animated launch screen with a scaling logo and transition.
- *NotificationManager.swift*: Manages daily scan reminders via local notifications.

#### Utils (Utils/)

- *OCRProcessor.swift*: Centralized utility for extracting text from images using Apple's Vision framework, invoked by the view model.

#### Resources (Resources/)

- *CategoryColor.swift*: Defines folder-based color schemes (e.g., red for Urgent) for consistent UI feedback across components.

---

### Data Handling & Persistence

- *UserDefaults* is used to store document metadata such as file paths, recognized text, and category in serialized Codable objects.
- *FileManager* is used for storing and retrieving scanned/imported document images.
- *No external/cloud services* are used—PaperMind is fully offline by design.
- For scaling, you may consider migrating to *Core Data*, *Realm*, or a structured FileManager directory system for better organization.

---

### Navigation Flow

- *SplashView* transitions to *HomeView*
- *HomeView* → tap folder → *FolderView* (filtered by category)
- *FolderView* → tap card → *DocumentDetailView*
- *HomeView* → tap scan/import → *CameraImagePicker/ImagePicker*
OCR and categorization are triggered post-scan/import and reflected in the correct folder


Navigation is powered by SwiftUI’s NavigationStack and @State`/`@ObservedObject bindings for seamless interaction across views.

---

### Architecture Summary

- *MVVM Pattern* is used to encapsulate document logic and UI separately:
  - ViewModels handle OCR, categorization, and persistence
  - Views remain reactive and display-only
- The architecture ensures *scalability*, *testability*, and *rapid prototyping*
Clear folder organization:  

  - Models/ for data  
  - ViewModels/ for logic  
  - Views/ for UI  
  - Resources/ and Utils/ for supporting components

The modular design allows the app to evolve into a production-grade document manager with minimal restructuring.
