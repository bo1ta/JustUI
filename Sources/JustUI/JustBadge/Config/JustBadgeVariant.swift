//
//  JustBadgeVariant.swift
//  JustUI
//
//  Created by Alexandru Solomon on 15.11.2025.
//

import SwiftUI

public enum JustBadgeVariant {
  case `default`
  case accent
  case success
  case warning
  case error

  var color: Color {
    switch self {
    case .default:
      .gray
    case .accent:
      .accentColor
    case .success:
      .green
    case .warning:
      .orange
    case .error:
      .red
    }
  }
}
