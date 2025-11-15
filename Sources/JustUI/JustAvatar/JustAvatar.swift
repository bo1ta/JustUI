//
//  JustAvatar.swift
//  JustUI
//
//  Created by Alexandru Solomon on 15.11.2025.
//

import SwiftUI

// MARK: - JustAvatar

public struct JustAvatar: View {
  private var image: Image?
  private var initials: String?
  private var size: CGFloat = 48
  private var showsStatus = false
  private var statusColor = Color.green
  private var backgroundColor = Color(.systemGray5)

  // MARK: - Init

  public init(initials: String? = nil) {
    self.initials = initials
  }

  // MARK: - Body

  public var body: some View {
    ZStack(alignment: .bottomTrailing) {
      baseAvatar

      if showsStatus {
        Circle()
          .fill(Color.white)
          .frame(width: size * 0.3, height: size * 0.3)
          .overlay(
            Circle()
              .fill(statusColor)
              .padding(3))
          .offset(x: size * 0.08, y: size * 0.08)
      }
    }
  }

  @ViewBuilder
  private var baseAvatar: some View {
    if let image {
      image
        .resizable()
        .scaledToFill()
        .frame(width: size, height: size)
        .clipShape(Circle())
    } else {
      Circle()
        .fill(backgroundColor)
        .frame(width: size, height: size)
        .overlay(
          Text(initials ?? "?")
            .font(.system(size: size * 0.4, weight: .semibold))
            .foregroundStyle(.primary))
    }
  }
}

// MARK: - Modifiers

extension JustAvatar {
  public func withImage(_ image: Image) -> Self {
    var avatar = self
    avatar.image = image
    return avatar
  }

  public func size(_ size: CGFloat) -> Self {
    var avatar = self
    avatar.size = size
    return avatar
  }

  public func statusColor(_ color: Color) -> Self {
    var avatar = self
    avatar.statusColor = color
    avatar.showsStatus = true
    return avatar
  }

  public func backgroundColor(_ color: Color) -> Self {
    var avatar = self
    avatar.backgroundColor = color
    return avatar
  }
}

// MARK: - Preview

#Preview {
  JustAvatar(initials: "AS")
    .statusColor(.green)
}
