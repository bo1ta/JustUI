//
//  JustList.swift
//  JustUI
//
//  Created by Alexandru Solomon on 15.11.2025.
//

import SwiftUI

public struct JustList<Content: View>: View {
  private let content: () -> Content
  private var title: String?

  // MARK: - Init

  public init(title: String? = nil, @ViewBuilder content: @escaping () -> Content) {
    self.title = title
    self.content = content
  }

  // MARK: - Body

  public var body: some View {
    VStack(alignment: .leading, spacing: .paddingSmall) {
      if let title {
        Text(title.uppercased())
          .font(.justLabel)
          .foregroundStyle(.secondary)
          .padding(.paddingMedium)
      }

      VStack(spacing: 0, content: content)
        .background(
          RoundedRectangle(cornerRadius: .cornerRadiusLarge)
            .fill(Color(.systemBackground))
            .shadow(color: .black.opacity(0.05), radius: 12, y: 6))
    }
    .padding(.horizontal, .paddingMedium)
  }
}

// MARK: - Preview

#Preview {
  JustList(title: "Settings") {
    JustListItem(title: "Profile")
      .withSubtitle("alex@justui.dev")
      .withLeadingIcon(Image(systemName: "person.circle"))
      .showsChevron()

    JustListItem(title: "Notifications")
      .withSubtitle("Daily summary at 9:00 AM")
      .withLeadingIcon(Image(systemName: "bell.badge"))
      .withTrailingText("Enabled")

    JustListItem(title: "Beta access")
      .withBadge("NEW")
      .withLeadingIcon(Image(systemName: "sparkles"))
      .showsChevron()
      .hideDivider()
  }
}
