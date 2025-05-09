# PaperMind – iOS Document Organizer (Prototype v1.0) for ITEL315 - Elective iOS Development

**PaperMind** is a minimalist iOS application prototype built with SwiftUI, designed to help users digitize, organize, and sort paper documents using OCR and smart folder categorization. It allows quick scanning, auto-sorting, and lightweight offline access to documents—ideal for students, professionals, and anyone aiming to reduce paper clutter.

> **Note**: This project is a learning prototype developed as part of an iOS development elective. While functional, it is not production-ready.

---

## Features

- Daily document scanning via camera or import  
- Optical Character Recognition (OCR) to extract key text  
- Auto-categorization into folders (e.g., Urgent, Later, Trash)  
- Tap-to-preview document with detail overlay  
- Swipe-to-delete or reassign document category  
- Custom haptics and visual feedback for actions  
- Local storage with persistent state using `UserDefaults`  
- Animated background and minimalist UI with category color-coding  
- Daily reminder notification to encourage consistent scanning  
- Splash screen with logo animation  

---

## Technology Stack

- **Swift / SwiftUI** – Modern, declarative UI  
- **VisionKit / Vision** – OCR and image recognition  
- **UserNotifications** – Daily scan reminders  
- **UserDefaults** – Lightweight document persistence  
- **Core Haptics** – Haptic feedback on interactions  
- **SF Symbols** – Iconography for category visuals  

---

## Screenshots

<div align="center">
  <img src="" width="45%" />
  <img src="" width="45%" />
</div>
<br/>
<div align="center">
  <img src="" width="45%" />
  <img src="" width="45%" />
</div>
<br/>
<div align="center">
  <img src="" width="45%" />
</div>

---

## Project Goals

- Explore real-time document scanning and OCR integration  
- Build an intuitive file management UX in SwiftUI  
- Practice structuring a small app using MVVM pattern  
- Implement persistent lightweight data storage  
- Design with user delight and clarity in mind  

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/papermind.git
   ```

2. Open `PaperMind.xcodeproj` in Xcode  
3. Run the app on a simulator or iOS device (iOS 17+ recommended)

---

## Areas for Improvement

### File Structure

- Separate models, views, and view models into clearly labeled folders (`Models/`, `Views/`, `ViewModels/`)  
- Modularize timer views, detail overlays, and reusable UI components

### State Management

- Move from `@State` and `@Binding` to `ObservableObject` and `@StateObject` for scalability and testability

### Persistence

- Replace `UserDefaults` with `CoreData` or `FileManager` for more robust data handling

### Localization

- Refactor hardcoded strings into a constants file or `Localizable.strings`

### OCR Enhancements

- Extend current OCR implementation with NLP techniques for smarter auto-categorization

---

## Documentation

- `docs/UI_Flow_Diagram.png` – Overview of screen transitions  
- `docs/Architecture_Overview.png` – High-level module structure  
- `docs/DEV_SETUP.md` – Developer setup and known issues

---

## Author

Developed by **Eissxs**  
*"WELP WELP"*
