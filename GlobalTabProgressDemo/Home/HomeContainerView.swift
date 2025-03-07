//
//  HomeContainerView.swift
//  GlobalTabProgressDemo
//
//  Created by 樋川大聖 on 2025/03/07.
//

import SwiftUI

struct HomeContainerView: View {
    @StateObject private var tabService = TabNavigationService.shared

    var body: some View {
        NavigationView {
            Group {
                switch tabService.homeDeepLink {
                case .root:
                    HomeView()
                case .detail(let id):
                    HomeDetailView(id: id)
                case .notification(let id):
                    NotificationDetailView(id: id)
                }
            }
            .navigationTitle("ホーム")
        }
    }
}

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        VStack(spacing: 20) {
            if viewModel.items.isEmpty {
                Text("データがありません")
            } else {
                List(viewModel.items, id: \.self) { item in
                    Text(item)
                }
            }

            Button("データを読み込む") {
                Task {
                    await viewModel.loadData()
                }
            }

            Button("設定画面へ") {
                viewModel.navigateToSettings()
            }
        }
    }
}

struct HomeDetailView: View {
    let id: String

    var body: some View {
        Text("詳細画面: \(id)")
    }
}

struct NotificationDetailView: View {
    let id: String

    var body: some View {
        Text("通知詳細: \(id)")
    }
}

