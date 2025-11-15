import SwiftUI

public extension Font {
  static var justTitleLarge: Font {
    .system(size: 22, weight: .semibold, design: .rounded)
  }

  static var justTitleMedium: Font {
    .system(size: 18, weight: .semibold, design: .rounded)
  }

  static var justBody: Font {
    .system(size: 16, weight: .regular, design: .rounded)
  }

  static var justCaption: Font {
    .system(size: 14, weight: .medium, design: .rounded)
  }

  static var justLabel: Font {
    .system(size: 13, weight: .semibold, design: .rounded)
  }
}
