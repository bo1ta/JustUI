//
//  JustChip.swift
//  JustUI
//
//  Created by Alexandru Solomon on 15.11.2025.
//

import SwiftUI

// MARK: - JustChip

public struct JustChip: View {
  private var text: String
  private var leadingIcon: Image?
  private var trailingIcon: Image?
  private var isSelected = false
  private var onTap: (() -> Void)?

  // MARK: - Computed properties

  private var backgroundColor: Color {
    isSelected ? Color.accentColor.opacity(0.2) : Color(.systemBackground)
  }

  private var borderColor: Color {
    isSelected ? Color.accentColor : Color.gray.opacity(0.3)
  }

  private var foregroundColor: Color {
    isSelected ? Color.accentColor : Color.primary
  }

  // MARK: - Init

  public init(_ text: String) {
    self.text = text
  }

  // MARK: - Body

  public var body: some View {
    HStack(spacing: .paddingExtraSmall) {
      if let leadingIcon {
        leadingIcon
          .font(.justCaption)
      }

      Text(text)
        .font(.justBody)

      if let trailingIcon {
        trailingIcon
          .font(.justCaption)
      }
    }
    .padding(.horizontal, .paddingMedium)
    .padding(.vertical, .paddingExtraSmall)
    .background(backgroundColor, in: .capsule)
    .overlay(
      Capsule()
        .strokeBorder(borderColor, lineWidth: 1))
    .foregroundStyle(foregroundColor)
    .onTapGesture {
      onTap?()
    }
  }
}

// MARK: - Modifiers

extension JustChip {
  public func withLeadingIcon(_ icon: Image) -> Self {
    var chip = self
    chip.leadingIcon = icon
    return chip
  }

  public func withTrailingIcon(_ icon: Image) -> Self {
    var chip = self
    chip.trailingIcon = icon
    return chip
  }

  public func selected(_ flag: Bool = true) -> Self {
    var chip = self
    chip.isSelected = flag
    return chip
  }

  public func onTap(_ action: @escaping () -> Void) -> Self {
    var chip = self
    chip.onTap = action
    return chip
  }
}

// MARK: - Preview

#Preview {
  VStack(alignment: .leading, spacing: .paddingMedium) {
    JustChip("Productivity")
      .withLeadingIcon(Image(systemName: "bolt.fill"))
    JustChip("Design")
      .selected()
    JustChip("Analytics")
      .withTrailingIcon(Image(systemName: "xmark"))
  }
  .padding()
  .background(Color(.systemGroupedBackground))
}
