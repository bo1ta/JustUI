//
//  JustButton.swift
//  JustUI
//
//  Created by Alexandru Solomon on 13.11.2025.
//

import SwiftUI

public struct JustButton<Content: View>: View {
  private var action: () -> Void
  private var content: () -> Content
  
  private var isEnabled = true
  private var fullWidth = false
  private var variant = ButtonVariant.primary
  private var size = ButtonSize.medium
  
  // MARK: - Init
  
  public init(action: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
    self.action = action
    self.content = content
  }
  
  public init(_ title: String, action: @escaping () -> Void) where Content == Text {
    self.action = action
    self.content = { Text(title) }
  }
  
  public init(_ titleKey: LocalizedStringKey, action: @escaping () -> Void) where Content == Text {
    self.action = action
    self.content = { Text(titleKey) }
  }
  
  // MARK: - Body
  
  public var body: some View {
    Button(action: action) {
      content()
    }
    .buttonStyle(JustButtonStyle(variant: variant, size: size, fullWidth: fullWidth, isEnabled: isEnabled))
    .padding(.horizontal, .screenEdgePadding)
    .padding(.vertical, .paddingSmall)
  }
  
  // MARK: - Modifiers
  
  public func fullWidth(_ enabled: Bool = true) -> Self {
    var button = self
    button.fullWidth = enabled
    return button
  }
  
  public func disabled(_ disabled: Bool = true) -> Self {
    var button = self
    button.isEnabled = !disabled
    return button
  }
  
  public func variant(_ variant: ButtonVariant) -> Self {
    var button = self
    button.variant = variant
    return button
  }
  
  public func size(_ size: ButtonSize) -> Self {
    var button = self
    button.size = size
    return button
  }
}

#Preview {
  VStack {
    JustButton("Plain", action: {})
      .fullWidth()
      .variant(.plain)
    JustButton(action: {}) {
      Text("Primary")
    }
    .fullWidth()
    JustButton("Secondary", action: {})
      .variant(.secondary)
      .fullWidth()
    JustButton("Success", action: {})
      .variant(.success)
      .fullWidth()
    JustButton("Danger", action: {})
      .fullWidth()
      .variant(.danger)
  }
}
