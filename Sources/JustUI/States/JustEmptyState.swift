//
//  JustEmptyState.swift
//  JustUI
//
//  Created by Alexandru Solomon on 15.11.2025.
//

import SwiftUI

// MARK: - JustEmptyState

public struct JustEmptyState: View {
  private var icon: Image?
  private var title: String
  private var message: String?
  private var actionTitle: String?
  private var action: (() -> Void)?

  // MARK: - Init

  public init(title: String, message: String? = nil) {
    self.title = title
    self.message = message
  }

  // MARK: - Body

  public var body: some View {
    VStack(spacing: .paddingLarge) {
      if let icon {
        icon
          .resizable()
          .scaledToFit()
          .frame(width: 72, height: 72)
          .foregroundStyle(Color.accentColor)
          .padding(.paddingMedium)
          .background(
            Circle()
              .fill(Color.accentColor.opacity(0.12)))
      }

      VStack(spacing: .paddingSmall) {
        Text(title)
          .font(.justTitleLarge)
          .multilineTextAlignment(.center)

        if let message {
          Text(message)
            .font(.justBody)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
        }
      }

      if let actionTitle, let action {
        Button(actionTitle, action: action)
          .buttonStyle(JustButtonStyle(variant: .primary, size: .medium, fullWidth: false, isEnabled: true))
      }
    }
    .padding(.paddingExtraLarge)
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
  }
}

// MARK: - Modifiers

extension JustEmptyState {
  public func withIcon(_ icon: Image) -> Self {
    var state = self
    state.icon = icon
    return state
  }

  public func withAction(_ title: String, handler: @escaping () -> Void) -> Self {
    var state = self
    state.actionTitle = title
    state.action = handler
    return state
  }
}

// MARK: - Preview

#Preview {
  JustEmptyState(
    title: "No tasks yet",
    message: "Create your first task to keep track of progress and unlock insights.")
    .withIcon(Image(systemName: "tray"))
    .withAction("Create task") { }
    .background(Color(.systemGroupedBackground))
}
