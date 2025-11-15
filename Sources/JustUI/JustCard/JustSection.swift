//
//  JustSection.swift
//  JustUI
//
//  Created by Alexandru Solomon on 15.11.2025.
//

import SwiftUI

public struct JustSection<Content: View>: View {
  private var title: String
  private var content: () -> Content

  var rightButtonTitle: String?
  var onRightButton: (() -> Void)?

  public init(title: String, @ViewBuilder content: @escaping () -> Content) {
    self.title = title
    self.content = content
  }

  public var body: some View {
    VStack(alignment: .leading, spacing: .paddingMedium) {
      HStack {
        Text(title)
          .font(.justTitleMedium)
        Spacer()

        if let rightButtonTitle, let onRightButton {
          Button(rightButtonTitle, action: onRightButton)
            .foregroundStyle(Color.accentColor)
            .buttonStyle(.plain)
        }
      }
      content()
    }
    .padding(.horizontal, .screenEdgePadding)
    .padding(.vertical, .paddingSmall)
  }

  public func withRightButton(_ title: String, onRightButton: @escaping () -> Void) -> Self {
    var section = self
    section.rightButtonTitle = title
    section.onRightButton = onRightButton
    return section
  }
}

#Preview {
  JustSection(title: "Summary of your day") {
    Text("hello")
  }
}
