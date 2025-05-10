# Developer Setup – PaperMind

This guide provides instructions to set up and run the *PaperMind* SwiftUI prototype locally for development and testing.

---

## System Requirements

Xcode 15 or later  
macOS Ventura or later  
iOS Simulator (iOS 17 or newer recommended)  
Apple Developer Account (only required for deployment to a physical device)


---

## Getting Started

1. *Clone the Repository*  
   ```
   git clone https://github.com/Eissxs/PaperMind.git
   cd papermind
   ```

2. *Open the Project in Xcode*  
   Open PaperMind.xcodeproj using Xcode.

3. *Run the Application*  
   - Select an iOS Simulator (e.g., iPhone 15 or newer)  
   - Press Cmd + R to build and launch the app

---

## Permissions and Setup Notes

### Camera & Photo Library Access  
- PaperMind uses the camera and photo picker to scan/import documents.  
- Allow access when prompted on first launch.

### Local Notifications  
- The app uses UNUserNotificationCenter to send daily scan reminders.  
- Ensure you grant notification permissions when prompted.

### Data Persistence  
- All documents and metadata are stored locally using UserDefaults and FileManager.  
- No internet or backend is required.

### Deploying to a Physical Device  
- Go to *Signing & Capabilities → Team* and select your Apple Developer account  
- Camera and notification permissions must be enabled in the app target


---

## Debugging Tips

### OCR Not Working  
Ensure images are clear and well-lit  

- Check TextRecognitionService.swift for Vision framework implementation  
- Handwriting may need to be more legible for accurate results


### Categorization Seems Incorrect  
- Review keyword logic in CategorizationManager.swift  
- Test with documents containing trigger words like “ASAP” or “Review”


### Notifications Not Triggering  
- Confirm notification permissions are granted in *Settings → Notifications*  
- In Simulator, use *Features → Trigger Notification* to simulate delivery

---

For issues or suggestions, please open an Issue on the [GitHub repository](https://github.com/Eissxs/PaperMind).
