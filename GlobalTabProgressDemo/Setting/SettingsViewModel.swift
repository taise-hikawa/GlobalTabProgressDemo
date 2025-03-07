//
//  SettingsViewModel.swift
//  GlobalTabProgressDemo
//
//  Created by 樋川大聖 on 2025/03/07.
//

import Foundation

@MainActor
class SettingsViewModel: ObservableObject {
    private let progressService = ProgressService.shared
    private let tabService = TabNavigationService.shared

    // 設定を保存して、ホーム画面の通知詳細に遷移する例
    func saveAndNavigateToNotification() async {
        progressService.showProgress(message: "設定を保存中...")

        do {
            // バックグラウンド処理
            try await Task.detached {
                try await Task.sleep(for: .seconds(1.5))
            }.value

            // 保存完了後、ホーム画面の通知詳細に遷移
            tabService.navigateToHome(deepLink: .notification(id: "settings-updated"))
        } catch {
            print("エラーが発生しました: \(error)")
        }

        progressService.hideProgress()
    }
}
