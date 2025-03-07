//
//  TabNavigationService.swift
//  GlobalTabProgressDemo
//
//  Created by 樋川大聖 on 2025/03/07.
//

import Combine
import Foundation

@MainActor
class TabNavigationService: ObservableObject {
    static let shared = TabNavigationService()
    @Published var selectedTab: AppTab = .home
    @Published var homeDeepLink: DeepLink.Home = .root
    @Published var settingsDeepLink: DeepLink.Settings = .root
    private let navigationSubject = PassthroughSubject<DeepLink, Never>()

    private init() {
        navigationSubject
            .receive(on: RunLoop.main)
            .sink { [weak self] deepLink in
                guard let self = self else { return }

                switch deepLink {
                case .home(let homeLink):
                    self.selectedTab = .home
                    self.homeDeepLink = homeLink
                case .settings(let settingsLink):
                    self.selectedTab = .settings
                    self.settingsDeepLink = settingsLink
                }
            }
            .store(in: &cancellables)
    }

    private var cancellables = Set<AnyCancellable>()

    func selectTab(_ tab: AppTab) {
        self.selectedTab = tab
    }

    func navigateToHome(deepLink: DeepLink.Home = .root) {
        navigationSubject.send(.home(deepLink))
    }

    func navigateToSettings(deepLink: DeepLink.Settings = .root) {
        navigationSubject.send(.settings(deepLink))
    }
}
