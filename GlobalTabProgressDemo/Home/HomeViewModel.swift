//
//  HomeViewModel.swift
//  GlobalTabProgressDemo
//
//  Created by 樋川大聖 on 2025/03/07.
//
import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    private let progressService = ProgressService.shared
    private let tabService = TabNavigationService.shared

    @Published var items: [String] = []

    func loadData() async {
        do {
            try await progressService.withProgress(message: "データを読み込んでいます...") {
                try await Task.detached(priority: .userInitiated) {
                    // 重い処理をシミュレート
                    try await Task.sleep(for: .seconds(2))
                }.value

                self.items = ["Item 1", "Item 2", "Item 3"]
                return ()
            }
        } catch {
            print("エラーが発生しました: \(error)")
        }
    }

    func navigateToSettings() {
        tabService.navigateToSettings()
    }
}
