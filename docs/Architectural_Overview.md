## Architectural Overview – PaperMind

PaperMind follows the MVVM (Model-View-ViewModel) architecture pattern to enable clean separation of responsibilities, offline data management, and intuitive SwiftUI interface design.

---

### Layers Overview

![Architecture Diagram](https://github.com/user-attachments/assets/your-placeholder-architecture-diagram-link)

---

### Component Breakdown

#### Models (Models/)

- *ScannedDocument.swift*: Defines the data structure for each scanned document, including image path, OCR text, category, and date. Conforms to Codable for lightweight persistence.

#### ViewModels (ViewModels/)

- *DocumentViewModel.swift*: Handles scanned document logic, including text extraction via Vision, auto-categorization, local saving, and category reassignment.

#### Views (Views/)

- *HomeView.swift*: Displays the three primary folders: Urgent, Later, and Trash. Each leads to a filtered list of documents.
- *CaptureView.swift*: Handles camera/photo library input and triggers OCR + categorization.
- *DocumentListView.swift*: Scrollable, categorized document list with thumbnails, excerpts, and date.
- *DocumentDetailView.swift*: Zoomed-in view with full image and OCR text overlay.
- *SplashView.swift*: Initial animated screen with logo scaling.
- *SettingsView.swift*: Allows enabling daily reminders and accessing app information.

#### Resources (Resources/)

- *Colors.swift*: Defines a centralized color palette (Urgent Red, Later Yellow, Trash Gray).
- *Assets.xcassets*: Includes folder icons, logo, and background images.
- *Constants.swift*: (Optional) Centralized constants for strings, keywords, etc.

---

### Data Handling & Persistence

- *UserDefaults* is used to store metadata (OCR text, category, date) for simplicity.
- *FileManager* stores captured/imported images locally using unique filenames.
- Documents are modeled using Codable for serialization and local persistence.
The app is designed as offline-first with no external backend.


*For future versions:*  
Adopt *Core Data* or *Realm* for scalable persistence and document querying.

---

### Navigation Flow

![Navigation Diagram](https://github.com/user-attachments/assets/your-placeholder-navigation-diagram-link)

- SwiftUI's NavigationStack and state bindings are used for seamless folder-to-document and capture flow.
All views follow lightweight navigation, with minimal modal usage to maintain flow clarity.


---

### Architecture Summary

- *MVVM architecture* ensures that views remain clean and reactive, while logic resides in view models.
- *Scalability-friendly*: Well-structured folders allow easy component refactoring and extension.
- *Persistence-first design*: Local-only storage makes it ideal for offline usage.
- *Haptics, animation, and notifications* are modularized for reusability and maintainability.
