//
//  JustStatCard.swift
//  JustUI
//
//  Created by Alexandru Solomon on 15.11.2025.
//

import SwiftUI

// MARK: - JustStatCard

public struct JustStatCard: View {
  private var title: String
  private var value: String
  private var subtitle: String?
  private var delta: String?
  private var deltaPositive = true
  private var icon: Image?
  private var variant = CardVariant.default

  // MARK: - Init

  public init(title: String, value: String) {
    self.title = title
    self.value = value
  }

  // MARK: - Body

  public var body: some View {
    VStack(alignment: .leading, spacing: .paddingMedium) {
      if let icon {
        icon
          .sizeAsIcon()
          .foregroundStyle(variant.iconColor)
      }

      VStack(alignment: .leading, spacing: .paddingSmall) {
        Text(title.uppercased())
          .font(.justLabel)
          .foregroundStyle(.secondary)

        Text(value)
          .font(.system(size: 32, weight: .bold, design: .rounded))

        if let subtitle {
          Text(subtitle)
            .font(.justCaption)
            .foregroundStyle(.secondary)
        }
      }

      if let delta {
        HStack(spacing: .paddingExtraSmall) {
          Image(systemName: deltaPositive ? "arrow.up.right" : "arrow.down.right")
            .font(.justCaption)
          Text(delta)
            .font(.justCaption)
          Text(deltaPositive ? "vs last period" : "vs last period")
            .font(.justCaption)
            .foregroundStyle(.secondary)
        }
        .foregroundStyle(deltaPositive ? Color.green : Color.red)
      }
    }
    .padding(.paddingLarge)
    .background(
      RoundedRectangle(cornerRadius: .cornerRadiusLarge)
        .fill(variant.backgroundGradient)
        .overlay(
          RoundedRectangle(cornerRadius: .cornerRadiusLarge)
            .stroke(variant.borderColor.opacity(0.5), lineWidth: variant.borderWidth))
        .shadow(color: .black.opacity(0.08), radius: .shadowRadiusSmall, y: 6))
  }
}

// MARK: - Modifiers

extension JustStatCard {
  public func subtitle(_ text: String) -> Self {
    var card = self
    card.subtitle = text
    return card
  }

  public func delta(_ text: String, positive: Bool = true) -> Self {
    var card = self
    card.delta = text
    card.deltaPositive = positive
    return card
  }

  public func icon(_ icon: Image) -> Self {
    var card = self
    card.icon = icon
    return card
  }

  public func variant(_ variant: CardVariant) -> Self {
    var card = self
    card.variant = variant
    return card
  }
}

// MARK: - Preview

#Preview {
  HStack(spacing: .paddingMedium) {
    JustStatCard(title: "Revenue", value: "$24.3K")
      .subtitle("Month to date")
      .delta("+12%", positive: true)
      .variant(.primary)

    JustStatCard(title: "Churn rate", value: "2.3%")
      .subtitle("Rolling 30 days")
      .delta("-0.4%", positive: false)
      .variant(.warning)
  }
  .padding()
  .background(Color(.systemGroupedBackground))
}
