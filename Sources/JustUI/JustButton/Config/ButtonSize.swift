//
//  ButtonSize.swift
//  JustUI
//
//  Created by Alexandru Solomon on 14.11.2025.
//

import SwiftUI

public enum ButtonSize {
  case small
  case medium
  case large

  var padding: CGFloat {
    switch self {
    case .small:
      .paddingMedium
    case .medium:
      .paddingLarge
    case .large:
      .paddingExtraLarge
    }
  }

  var font: Font {
    switch self {
    case .small:
      .justLabel
    case .medium:
      .justBody
    case .large:
      .justTitleMedium
    }
  }
}
