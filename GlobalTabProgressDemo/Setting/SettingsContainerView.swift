//
//  SettingsContainerView.swift
//  GlobalTabProgressDemo
//
//  Created by 樋川大聖 on 2025/03/07.
//

import SwiftUI

struct SettingsContainerView: View {
    @StateObject private var tabService = TabNavigationService.shared

    var body: some View {
        NavigationView {
            Group {
                switch tabService.settingsDeepLink {
                case .root:
                    SettingsView()
                case .profile:
                    ProfileSettingsView()
                case .preferences:
                    PreferencesSettingsView()
                }
            }
            .navigationTitle("設定")
        }
    }
}

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()

    var body: some View {
        List {
            NavigationLink("プロフィール", destination: ProfileSettingsView())
            NavigationLink("環境設定", destination: PreferencesSettingsView())

            Button("ホームに戻る") {
                Task {
                    await viewModel.saveAndNavigateToNotification()
                }
            }
        }
    }
}

struct ProfileSettingsView: View {
    @StateObject private var tabService = TabNavigationService.shared

    var body: some View {
        VStack(spacing: 20) {
            Text("プロフィール設定")
            Button("ホーム画面の商品詳細へ") {
                tabService.navigateToHome(deepLink: .detail(id: "recommended-item"))
            }
        }
        .navigationTitle("プロフィール")
    }
}

struct PreferencesSettingsView: View {
    @StateObject private var tabService = TabNavigationService.shared

    var body: some View {
        VStack(spacing: 20) {
            Text("環境設定")
            Button("最新の通知を確認") {
                tabService.navigateToHome(deepLink: .notification(id: "latest"))
            }
        }
        .navigationTitle("環境設定")
    }
}
