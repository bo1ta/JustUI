//
//  CardVariant.swift
//  JustUI
//
//  Created by Alexandru Solomon on 15.11.2025.
//

import SwiftUI

public enum CardVariant {
  case `default`
  case filled(Color)
  case outlined
  case primary
  case success
  case warning
  case error

  public var iconColor: Color {
    switch self {
    case .default, .outlined: .primary
    case .primary: .accentColor
    case .success: .green
    case .warning: .orange
    case .error: .red
    case .filled(let color): color
    }
  }

  public var accentColor: Color {
    switch self {
    case .default, .outlined: .accentColor
    case .primary: .accentColor
    case .success: .green
    case .warning: .orange
    case .error: .red
    case .filled(let color): color
    }
  }

  public var borderWidth: CGFloat {
    switch self {
    case .default, .outlined: 0.8
    default: 1.2
    }
  }

  public var borderColor: Color {
    accentColor.opacity(0.35)
  }

  public var backgroundGradient: LinearGradient {
    LinearGradient(
      colors: gradientColors,
      startPoint: .topLeading,
      endPoint: .bottomTrailing
    )
  }

  private var gradientColors: [Color] {
    switch self {
    case .default:
      return [
        Color(.white),
        Color(.systemGray6)
      ]
    case .outlined:
      return [
        Color(.systemGray6),
        Color(.systemGray5)
      ]
    case .primary:
      return [
        Color.accentColor.opacity(0.25),
        Color.accentColor.opacity(0.55)
      ]
    case .success:
      return [
        Color.green.opacity(0.25),
        Color.green.opacity(0.55)
      ]
    case .warning:
      return [
        Color.orange.opacity(0.25),
        Color.orange.opacity(0.55)
      ]
    case .error:
      return [
        Color.red.opacity(0.25),
        Color.red.opacity(0.55)
      ]
    case .filled(let color):
      return [
        color.opacity(0.25),
        color.opacity(0.6)
      ]
    }
  }
}
