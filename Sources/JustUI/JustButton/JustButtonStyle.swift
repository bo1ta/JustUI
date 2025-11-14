//
//  JustButtonStyle.swift
//  JustUI
//
//  Created by Alexandru Solomon on 14.11.2025.
//

import SwiftUI

// MARK: - JustButtonStyle

public struct JustButtonStyle: ButtonStyle {
  let variant: ButtonVariant
  let size: ButtonSize
  let fullWidth: Bool
  let isEnabled: Bool

  private var backgroundGradient: LinearGradient {
    guard isEnabled else {
      return LinearGradient(
        colors: [.gray.opacity(0.3), .gray.opacity(0.2)],
        startPoint: .top,
        endPoint: .bottom)
    }

    let baseColor: Color
    switch variant {
    case .plain:
      baseColor = .white
    case .primary:
      baseColor = .accentColor
    case .secondary:
      return LinearGradient(colors: [.clear], startPoint: .top, endPoint: .bottom)
    case .danger:
      baseColor = .red
    case .success:
      baseColor = .green
    }

    return LinearGradient(
      colors: [
        baseColor.opacity(0.9),
        baseColor,
        baseColor.opacity(0.95),
      ],
      startPoint: .topLeading,
      endPoint: .bottomTrailing)
  }

  private var pressedGradient: LinearGradient {
    guard isEnabled else {
      return LinearGradient(
        colors: [.gray.opacity(0.25), .gray.opacity(0.15)],
        startPoint: .top,
        endPoint: .bottom)
    }

    let baseColor: Color
    switch variant {
    case .plain:
      baseColor = .white
    case .primary:
      baseColor = .accentColor
    case .secondary:
      return LinearGradient(colors: [.accentColor.opacity(0.1)], startPoint: .top, endPoint: .bottom)
    case .danger:
      baseColor = .red
    case .success:
      baseColor = .green
    }

    return LinearGradient(
      colors: [
        baseColor.opacity(0.8),
        baseColor.opacity(0.7),
        baseColor.opacity(0.75),
      ],
      startPoint: .topLeading,
      endPoint: .bottomTrailing)
  }

  private var foregroundColor: Color {
    guard isEnabled else { return .gray }

    switch variant {
    case .plain:
      return .black
    case .primary:
      return .white
    case .secondary:
      return .accentColor
    case .danger:
      return .white
    case .success:
      return .white
    }
  }

  private var shadowRadius: CGFloat {
    switch variant {
    case .plain, .secondary:
      0
    default:
      .shadowRadiusExtraSmall
    }
  }

  private var borderColor: Color {
    guard isEnabled else { return .gray }

    switch variant {
    case .plain, .primary, .danger, .success:
      return .clear
    case .secondary: return .accentColor
    }
  }

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(size.font)
      .shadow(radius: shadowRadius)
      .frame(maxWidth: fullWidth ? .infinity : nil)
      .foregroundStyle(foregroundColor)
      .padding(size.padding)
      .background(
        configuration.isPressed ? pressedGradient : backgroundGradient,
        in: .rect(cornerRadius: .cornerRadiusLarge))
      .overlay(
        RoundedRectangle(cornerRadius: .cornerRadiusLarge)
          .stroke(borderColor, lineWidth: variant == .secondary ? 2 : 0))
      .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
      .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
      .shadow(radius: .shadowRadiusSmall)
  }
}
