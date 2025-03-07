//
//  NotificationHandler.swift
//  GlobalTabProgressDemo
//
//  Created by 樋川大聖 on 2025/03/07.
//

import Foundation

class NotificationHandler {
    static func handlePushNotification(type: String, id: String) {
        Task { @MainActor in
            switch type {
            case "notification":
                TabNavigationService.shared.navigateToHome(deepLink: .notification(id: id))
            case "settings":
                TabNavigationService.shared.navigateToSettings(deepLink: .preferences)
            default:
                TabNavigationService.shared.navigateToHome()
            }
        }
    }
}
