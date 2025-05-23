# **PaperMind v1.0**

![Swift](https://img.shields.io/badge/Swift-5.0%2B-orange)
![Platform](https://img.shields.io/badge/Platform-iOS%2017.0%2B-blue)
![License](https://img.shields.io/badge/License-Apache--2.0-green)
![Status](https://img.shields.io/badge/Status-Prototype-yellow)

*ITEL315 – Elective iOS Development*

PaperMind is a minimalist iOS app built with SwiftUI that helps users digitize and organize physical documents using OCR and automatic categorization. With features like document scanning, smart sorting, and intuitive gestures, PaperMind makes document management effortless and intuitive.

> **Note:** This is a **prototype-level project** developed for learning SwiftUI, exploring OCR features, and building functional offline-first file organization workflows.

## **Key Features**

- **Scan & Import**
  - Capture documents via camera
  - Import from photo library
  - Quick batch scanning
  - Auto-adjusting contrast and brightness

- **OCR-Powered Sorting**
  - Extracts key text using Vision OCR
  - Real-time text recognition
  - Automatic metadata extraction
  - Searchable document content

- **Smart Categorization**
  - Automatically sorts into folders (Urgent, Later, Trash)
  - Custom category creation
  - Visual category indicators
  - AI-suggested sorting options

- **Document Management**
  - Tap-to-zoom document preview
  - Text overlay with highlight options
  - Swipe actions for reassignment
  - Batch operations support

- **User Experience**
  - Clean, minimalist interface
  - Haptic feedback via Core Haptics
  - Smooth animations and transitions
  - Dark mode support
  - Daily scan reminders

## **Tech Stack**

- **Framework:** SwiftUI
- **OCR Processing:** VisionKit / Vision Framework
- **Data Persistence:** UserDefaults (prototype)
- **Notifications:** UserNotifications
- **Architecture Pattern:** MVVM
- **Tactile Feedback:** Core Haptics
- **Design:** SF Symbols, Custom Color Palette

## **App Screenshots**

<div align="center">
  <img src="https://github.com/user-attachments/assets/c3211df6-3407-43f4-9ae5-58d22bc808f7" width="45%" />
  <img src="https://github.com/user-attachments/assets/91d27cd9-e593-4209-b14e-0cdba6929cba" width="45%" />
</div>
<br/>
<div align="center">
  <img src="https://github.com/user-attachments/assets/00fbccdc-69a8-4048-87f7-b7fd4297ea86" width="45%" />
  <img src="https://github.com/user-attachments/assets/2d5a218b-38c8-432e-893d-c3d6abde6b45" width="45%" />
</div>
<br/>
<div align="center">
  <img src="https://github.com/user-attachments/assets/18c8790a-3cef-4c3a-89bb-5ed5d0552e74" width="45%"/>
</div>

## **Project Structure**

```
PaperMind/
├── Models/
│   └── ScannedDocument.swift
├── ViewModels/
│   └── DocumentScannerViewModel.swift
├── Utils/
│   └── OCRProcessor.swift
├── Resources/
│   └── CategoryColor.swift
├── Views/
│   ├── CameraImagePicker.swift
│   ├── DocumentCardView.swift
│   ├── DocumentDetailView.swift
│   ├── FolderCard.swift
│   ├── FolderView.swift
│   ├── HomeView.swift
│   ├── ImagePicker.swift
│   ├── NotificationManager.swift
│   ├── SplashView.swift
│   └── ZoomableImageView.swift
├── Assets.xcassets/
└── PaperMindApp.swift
```

## **Requirements**

- iOS 17.0+
- Xcode 15.0+
- Swift 5.0+

## **Installation**

1. Clone the repository:
   ```bash
   git clone https://github.com/Eissxs/PaperMind.git
   ```

2. Open `PaperMind.xcodeproj` in Xcode

3. Build and run the project

## **Features in Detail**

### Document Scanning & Import
- Camera-based document capture
- Photo library import
- Auto-edge detection
- Perspective correction
- Brightness/contrast enhancement

### OCR Processing
- Text extraction using Vision framework
- Keyword identification
- Content-based categorization
- Searchable document text

### Smart Organization
- Automatic sorting algorithms
- Custom category creation
- Visual category indicators
- Document reclassification

### User Experience
- Minimalist, distraction-free design
- Intuitive swipe actions
- Haptic feedback for interactions
- Animated transitions
- Dark mode compatibility

## **Privacy Permissions**

The app requires the following permissions:
- Camera (for document scanning)
- Photo Library (for importing documents)
- Notifications (for daily reminders)

## **Contributing**

Feel free to submit issues and enhancement requests!

## **License**

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## **Documentation**

- [**UI Flow Diagram**](docs/UI_Flow_Diagram.png) *(Note: Created using Eraser AI; not fully accurate)*  
- [**Architecture Overview**](docs/Architecture_Overview.png)  
- [**Developer Setup Guide**](docs/DEV_SETUP.md)

## **Areas for Improvement (Toward Production Readiness)**

### Architecture & Code Quality
- Implement comprehensive unit tests and UI tests
- Add CI/CD pipeline for automated testing and deployment
- Enhance error handling and logging mechanisms
- Implement proper dependency injection
- Add comprehensive code documentation
- Migrate from `UserDefaults` to CoreData for robust persistence

### Security
- Implement secure document storage encryption
- Add input validation and sanitization
- Implement proper SSL pinning for future API integrations
- Add app state encryption for sensitive data

### Performance
- Optimize OCR processing pipeline
- Implement proper caching mechanisms
- Add performance monitoring and analytics
- Optimize document storage and retrieval

### Features & UX
- Add document backup and restore functionality
- Implement user accounts and cloud sync capabilities
- Enhance text recognition accuracy
- Improve accessibility features
- Add localization support for multiple languages
- Implement advanced document categorization algorithms
- Add document editing and annotation capabilities

### Infrastructure
- Set up proper monitoring and crash reporting
- Implement analytics for user behavior tracking
- Add proper versioning and update mechanism
- Prepare for App Store submission requirements

## **Author**

Developed by **Eissxs**

## **Acknowledgments**

- Apple SwiftUI Framework
- Vision Framework
- VisionKit
- UserNotifications Framework

---

*"Digitize, organize, and declutter your paper life with PaperMind!"* 

---
