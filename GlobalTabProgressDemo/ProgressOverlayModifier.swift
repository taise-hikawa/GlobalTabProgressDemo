//
//  ProgressOverlayModifier.swift
//  GlobalTabProgressDemo
//
//  Created by 樋川大聖 on 2025/03/07.
//

import SwiftUI

struct ProgressOverlayModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            content
            ProgressOverlay()
        }
    }
}

extension View {
    func withProgressOverlay() -> some View {
        modifier(ProgressOverlayModifier())
    }
}
