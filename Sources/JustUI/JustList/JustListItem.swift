//
//  JustListItem.swift
//  JustUI
//
//  Created by Alexandru Solomon on 15.11.2025.
//

import SwiftUI

// MARK: - JustListItem

public struct JustListItem: View {
  private var title: String
  private var subtitle: String?
  private var leadingIcon: Image?
  private var badgeText: String?
  private var trailingText: String?
  private var trailingIcon: Image?
  private var showsChevron = false
  private var hideDivider = false
  private var onTap: (() -> Void)?

  // MARK: - Init

  public init(title: String) {
    self.title = title
  }

  // MARK: - Body

  public var body: some View {
    VStack(spacing: 0) {
      HStack(spacing: .paddingMedium) {
        if let leadingIcon {
          leadingIcon
            .sizeAsIcon()
            .frame(width: 32, height: 32)
            .foregroundStyle(Color.accentColor)
            .background(
              Circle()
                .fill(Color.accentColor.opacity(0.12)))
        }

        VStack(alignment: .leading, spacing: .paddingExtraSmall) {
          Text(title)
            .font(.justBody)

          if let subtitle {
            Text(subtitle)
              .font(.justCaption)
              .foregroundStyle(.secondary)
          }
        }

        Spacer(minLength: .paddingMedium)

        if let badgeText {
          Text(badgeText)
            .font(.justCaption)
            .padding(.horizontal, .paddingSmall)
            .padding(.vertical, 4)
            .background(Color.accentColor.opacity(0.15), in: Capsule())
        }

        if let trailingText {
          Text(trailingText)
            .font(.justCaption)
            .foregroundStyle(.secondary)
        }

        if let trailingIcon {
          trailingIcon
            .foregroundStyle(.secondary)
        }

        if showsChevron {
          Image(systemName: "chevron.right")
            .font(.justCaption)
            .foregroundStyle(.secondary)
        }
      }
      .contentShape(Rectangle())
      .padding(.horizontal, .paddingLarge)
      .padding(.vertical, .paddingMedium)
      .onTapGesture {
        onTap?()
      }

      if !hideDivider {
        Divider()
          .padding(.leading, leadingIcon == nil ? .paddingLarge : 56)
      }
    }
  }
}

// MARK: - Modifiers

extension JustListItem {
  public func withSubtitle(_ subtitle: String) -> Self {
    var item = self
    item.subtitle = subtitle
    return item
  }

  public func withLeadingIcon(_ icon: Image) -> Self {
    var item = self
    item.leadingIcon = icon
    return item
  }

  public func withBadge(_ text: String) -> Self {
    var item = self
    item.badgeText = text
    return item
  }

  public func withTrailingText(_ text: String) -> Self {
    var item = self
    item.trailingText = text
    return item
  }

  public func withTrailingIcon(_ icon: Image) -> Self {
    var item = self
    item.trailingIcon = icon
    return item
  }

  public func showsChevron(_ flag: Bool = true) -> Self {
    var item = self
    item.showsChevron = flag
    return item
  }

  public func hideDivider(_ flag: Bool = true) -> Self {
    var item = self
    item.hideDivider = flag
    return item
  }

  public func onTap(_ action: @escaping () -> Void) -> Self {
    var item = self
    item.onTap = action
    return item
  }
}

// MARK: - Preview

#Preview {
  VStack(spacing: 0) {
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
  .background(Color(.systemGroupedBackground))
}
