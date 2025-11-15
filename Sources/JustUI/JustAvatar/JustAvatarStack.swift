//
//  JustAvatarStack.swift
//  JustUI
//
//  Created by Alexandru Solomon on 15.11.2025.
//

import SwiftUI

public struct JustAvatarStack: View {
  private var avatars: [JustAvatar]
  private var overlap: CGFloat = 16

  public init(avatars: [JustAvatar]) {
    self.avatars = avatars
  }

  public var body: some View {
    HStack(spacing: -overlap) {
      ForEach(avatars.indices, id: \.self) { index in
        avatars[index]
          .overlay(Circle().stroke(Color.white, lineWidth: 2))
          .zIndex(Double(avatars.count - index))
      }
    }
  }

  // MARK: - Modifier

  public func overlap(_ value: CGFloat) -> Self {
    var stack = self
    stack.overlap = value
    return stack
  }
}

// MARK: - Preview

#Preview {
  VStack(spacing: .paddingLarge) {
    JustAvatarStack(
      avatars: [
        JustAvatar(initials: "AS"),
        JustAvatar(initials: "KR").statusColor(.orange),
        JustAvatar(initials: "TM").statusColor(.green),
      ])
  }
  .padding()
  .background(Color(.systemGroupedBackground))
}
