//
//  JustCard.swift
//  JustUI
//
//  Created by Alexandru Solomon on 15.11.2025.
//

import SwiftUI

// MARK: - JustCard

public struct JustCard<Content: View>: View {
  private let content: () -> Content

  private var variant = CardVariant.default
  private var title: String?
  private var subtitle: String?
  private var icon: Image?

  // MARK: - Init

  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  // MARK: - Body

  public var body: some View {
    VStack(alignment: .leading, spacing: .paddingMedium) {
      if hasHeader {
        headerContent
          .padding(.bottom, .paddingExtraSmall)
      }

      VStack(alignment: .leading, spacing: .paddingSmall, content: content)
        .font(.justBody)
    }
    .padding(.paddingLarge)
    .background(cardBackground)
    .overlay(alignment: .leading, content: accentStripe)
    .padding(.horizontal, .paddingMedium)
    .padding(.vertical, .paddingSmall)
  }

  private var headerContent: some View {
    HStack(spacing: .paddingMedium) {
      if let icon {
        icon
          .sizeAsIcon()
          .foregroundStyle(variant.iconColor)
      }

      VStack(alignment: .leading, spacing: .paddingExtraSmall) {
        if let title {
          Text(title)
            .font(.justTitleMedium)
        }

        if let subtitle {
          Text(subtitle)
            .font(.justCaption)
            .foregroundStyle(.secondary)
        }
      }

      Spacer()
    }
  }

  private var hasHeader: Bool {
    title != nil || subtitle != nil || icon != nil
  }

  private var cardBackground: some View {
    RoundedRectangle(cornerRadius: .cornerRadiusLarge)
      .fill(variant.backgroundGradient)
      .overlay(
        RoundedRectangle(cornerRadius: .cornerRadiusLarge)
          .strokeBorder(variant.borderColor, lineWidth: variant.borderWidth)
      )
      .shadow(color: .black.opacity(0.08), radius: .shadowRadiusSmall, y: 6)
  }

  private func accentStripe() -> some View {
    RoundedRectangle(cornerRadius: .cornerRadiusTiny)
      .fill(variant.accentColor.opacity(0.8))
      .frame(width: 4)
      .padding(.vertical, .paddingMedium)
  }
}

// MARK: - Modifiers

extension JustCard {
  public func variant(_ variant: CardVariant) -> Self {
    var card = self
    card.variant = variant
    return card
  }

  public func withTitle(_ title: String) -> Self {
    var card = self
    card.title = title
    return card
  }

  public func withSubtitle(_ subtitle: String) -> Self {
    var card = self
    card.subtitle = subtitle
    return card
  }

  public func withIcon(_ icon: Image) -> Self {
    var card = self
    card.icon = icon
    return card
  }
}

// MARK: - Preview

#Preview {
  ScrollView {
    VStack(spacing: .paddingMedium) {
      JustCard {
        Text("Daily reminder to refactor one thing that annoys you.")
        Text("Micro-improvements compound into huge wins.")
      }
      .withIcon(Image(systemName: "sparkles"))
      .withTitle("Tip of the day")
      .withSubtitle("Keep shipping polished work.")

      JustCard {
        Text("Database latency exceeded threshold.")
        Text("Investigate read replicas in region us-east-1.")
      }
      .withIcon(Image(systemName: "exclamationmark.triangle.fill"))
      .withTitle("Incident #350")
      .withSubtitle("Performance degradation detected")
      .variant(.warning)
    }
  }
  .padding()
  .background(Color(.systemGroupedBackground))
}
