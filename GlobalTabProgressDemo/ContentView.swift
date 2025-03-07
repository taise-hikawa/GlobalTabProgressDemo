//
//  ContentView.swift
//  GlobalTabProgressDemo
//
//  Created by 樋川大聖 on 2025/03/07.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var tabService = TabNavigationService.shared

    var body: some View {
        TabView(selection: $tabService.selectedTab) {
            HomeContainerView()
                .tabItem {
                    Label(AppTab.home.title, systemImage: AppTab.home.iconName)
                }
                .tag(AppTab.home)

            SettingsContainerView()
                .tabItem {
                    Label(AppTab.settings.title, systemImage: AppTab.settings.iconName)
                }
                .tag(AppTab.settings)
        }
        .withTabNavigation()
    }
}

#Preview {
    ContentView()
}
