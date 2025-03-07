//
//  ProgressOverlay.swift
//  GlobalTabProgressDemo
//
//  Created by 樋川大聖 on 2025/03/07.
//

import SwiftUI

struct ProgressOverlay: View {
    @ObservedObject private var service = ProgressService.shared

    var body: some View {
        if service.isLoading {
            ZStack {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 16) {
                    ProgressView()
                        .scaleEffect(1.5)

                    Text(service.message)
                        .font(.callout)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                }
                .padding(24)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemBackground).opacity(0.8))
                )
                .shadow(radius: 8)
            }
            .transition(.opacity)
        }
    }
}
