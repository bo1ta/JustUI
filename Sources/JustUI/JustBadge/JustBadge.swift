//
//  JustBadge.swift
//  JustUI
//
//  Created by Alexandru Solomon on 15.11.2025.
//

import SwiftUI

// MARK: - JustBadge

public struct JustBadge: View {
  private var text: String
  private var variant = JustBadgeVariant.accent
  private var style = JustBadgeStyle.tinted
  private var icon: Image?

  // MARK: - Computed properties

  private var foregroundColor: Color {
    switch style {
    case .filled:
      Color.white
    default:
      variant.color
    }
  }

  @ViewBuilder
  private var backgroundShape: some View {
    Capsule()
      .fill(backgroundColor)
      .overlay(
        Capsule()
          .strokeBorder(variant.color.opacity(style == .subtle ? 0.4 : 0.8), lineWidth: style == .filled ? 0 : 1))
      .shadow(color: variant.color.opacity(0.12), radius: style == .filled ? 6 : 0, y: style == .filled ? 2 : 0)
  }

  private var backgroundColor: Color {
    switch style {
    case .subtle:
      variant.color.opacity(0.08)
    case .tinted:
      variant.color.opacity(0.18)
    case .filled:
      variant.color
    }
  }

  // MARK: - Init

  public init(_ text: String) {
    self.text = text
  }

  // MARK: - Body

  public var body: some View {
    HStack(spacing: .paddingExtraSmall) {
      if let icon {
        icon
          .font(.justCaption)
      }

      Text(text.uppercased())
        .font(.justCaption)
        .tracking(0.5)
    }
    .padding(.horizontal, .paddingSmall)
    .padding(.vertical, 6)
    .foregroundStyle(foregroundColor)
    .background(backgroundShape)
  }
}

// MARK: - Modifiers

extension JustBadge {
  public func variant(_ variant: JustBadgeVariant) -> Self {
    var badge = self
    badge.variant = variant
    return badge
  }

  public func style(_ style: JustBadgeStyle) -> Self {
    var badge = self
    badge.style = style
    return badge
  }

  public func withIcon(_ icon: Image) -> Self {
    var badge = self
    badge.icon = icon
    return badge
  }
}

// MARK: - Preview

#Preview {
  VStack(alignment: .leading, spacing: .paddingMedium) {
    JustBadge("New")
    JustBadge("Alpha")
      .variant(.warning)
      .style(.filled)
      .withIcon(Image(systemName: "flame.fill"))
    JustBadge("Syncing")
      .variant(.success)
      .style(.subtle)
  }
  .padding()
  .background(Color(.systemGroupedBackground))
}
