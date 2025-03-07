//
//  DeepLink.swift
//  GlobalTabProgressDemo
//
//  Created by 樋川大聖 on 2025/03/07.
//

import Foundation

enum DeepLink {
    // ホームタブ内のディープリンク
    enum Home {
        case root
        case detail(id: String)
        case notification(id: String)
    }

    // 設定タブ内のディープリンク
    enum Settings {
        case root
        case profile
        case preferences
    }

    // アプリ全体のディープリンク
    case home(Home)
    case settings(Settings)
}
