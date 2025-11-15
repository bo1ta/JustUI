//
//  JustToggle.swift
//  JustUI
//
//  Created by Alexandru Solomon on 14.11.2025.
//

import SwiftUI

// MARK: - JustToggle

public struct JustToggle: View {
  @Binding private var isToggled: Bool

  private var title: String
  private var subtitle: String?
  private var icon: Image?
  private var variant = ToggleVariant.default

  // MARK: - Init

  public init(isToggled: Binding<Bool>, title: String) {
    _isToggled = isToggled
    self.title = title
  }

  // MARK: - Body

  public var body: some View {
    HStack {
      if let icon {
        icon
          .sizeAsIcon()
          .foregroundStyle(.secondary)
      }

      VStack(alignment: .leading, spacing: .paddingSmall) {
        Text(title)
          .font(.justBody)

        if let subtitle {
          Text(subtitle)
            .font(.justCaption)
            .foregroundStyle(.secondary)
        }
      }

      Spacer()

      switch variant {
      case .default, .switch:
        JustSwitch(isOn: $isToggled)
      case .checkbox:
        JustCheckbox(isChecked: $isToggled)
      }
    }
    .padding(.horizontal, .screenEdgePadding)
    .padding(.vertical, .paddingSmall)
  }
}

// MARK: - Modifiers

extension JustToggle {
  public func variant(_ variant: ToggleVariant) -> Self {
    var toggle = self
    toggle.variant = variant
    return toggle
  }

  public func withSubtitle(_ subtitle: String) -> Self {
    var toggle = self
    toggle.subtitle = subtitle
    return toggle
  }

  public func withIcon(_ icon: Image) -> Self {
    var toggle = self
    toggle.icon = icon
    return toggle
  }
}

// MARK: - Preview

#Preview {
  @Previewable @State var isOn = false

  JustToggle(isToggled: $isOn, title: "Enable notifications")
  JustToggle(isToggled: $isOn, title: "Enable notifications")
    .variant(.checkbox)
}
