//
//  AppTab.swift
//  GlobalTabProgressDemo
//
//  Created by 樋川大聖 on 2025/03/07.
//

enum AppTab: Int, CaseIterable, Identifiable {
    case home = 0
    case settings = 1

    var id: Int { self.rawValue }

    var title: String {
        switch self {
        case .home: return "ホーム"
        case .settings: return "設定"
        }
    }

    var iconName: String {
        switch self {
        case .home: return "house"
        case .settings: return "gear"
        }
    }
}
