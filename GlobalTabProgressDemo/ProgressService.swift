//
//  ProgressService.swift
//  GlobalTabProgressDemo
//
//  Created by 樋川大聖 on 2025/03/07.
//
import SwiftUI

@MainActor
class ProgressService: ObservableObject {
    static let shared = ProgressService()
    @Published var isLoading: Bool = false
    @Published var message: String = "読み込み中..."
    private init() {}
    func showProgress(message: String = "読み込み中...") {
        self.message = message
        withAnimation {
            self.isLoading = true
        }
    }
    func hideProgress() {
        withAnimation {
            self.isLoading = false
        }
    }
    func withProgress<T>(message: String = "読み込み中...", task: @MainActor @escaping () async throws -> T) async throws -> T {
        showProgress(message: message)

        do {
            let result = try await task()
            hideProgress()
            return result
        } catch {
            hideProgress()
            throw error
        }
    }
}
