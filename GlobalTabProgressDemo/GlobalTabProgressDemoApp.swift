//
//  GlobalTabProgressDemoApp.swift
//  GlobalTabProgressDemo
//
//  Created by 樋川大聖 on 2025/03/07.
//

import SwiftUI

@main
struct GlobalTabProgressDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .withProgressOverlay()
        }
    }
}
