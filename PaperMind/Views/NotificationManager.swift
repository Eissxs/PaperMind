//
//  NotificationManager.swift
//  PaperMind
//
//  Created by Michael Eissen San Antonio on 5/7/25.
//

import Foundation
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()

    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, _ in
            if granted {
                self.scheduleDailyReminder()
            }
        }
    }

    func scheduleDailyReminder() {
        let content = UNMutableNotificationContent()
        content.title = "Time to Scan 📄"
        content.body = "Keep your papers organized. Scan today!"
        content.sound = .default

        var date = DateComponents()
        date.hour = 18 // 6 PM

        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        let request = UNNotificationRequest(identifier: "daily_scan_reminder", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
}
