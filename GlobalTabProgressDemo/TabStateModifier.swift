//
//  TabStateModifier.swift
//  GlobalTabProgressDemo
//
//  Created by 樋川大聖 on 2025/03/07.
//

import SwiftUI

struct TabStateModifier: ViewModifier {
    @ObservedObject private var tabService = TabNavigationService.shared

    func body(content: Content) -> some View {
        content
            .onChange(of: tabService.selectedTab) { _ in
                // タブが変更されたときの追加処理をここに記述可能
                // 例: アナリティクスの送信など
            }
    }
}

extension View {
    func withTabNavigation() -> some View {
        modifier(TabStateModifier())
    }
}
