//
//  JustTextField.swift
//  JustUI
//
//  Created by Alexandru Solomon on 14.11.2025.
//

import SwiftUI

public struct JustTextField: View {
  private var text: Binding<String>
  private var textHint: String
  private var variant: TextFieldVariant = .default
  private var validationState: TextFieldValidationState = .default
  private var isEnabled: Bool = true
  private var title: String?
  private var leadingIcon: Image?
  private var trailingIcon: Image?
  private var showClearButton: Bool = false
  private var onClear: (() -> Void)?
  
  // MARK: - Computed properties
  
  private var iconColor: Color {
    guard isEnabled else {
      return .gray
    }
    
    switch validationState {
    case .default:
      return .gray
    case .error:
      return .red
    case .success:
      return .green
    case .warning:
      return .orange
    }
  }
  
  private var backgroundColor: Color {
    guard isEnabled else {
      return .gray.opacity(0.1)
    }
    
    switch validationState {
    case .default:
      return .white
    case .error:
      return .red.opacity(0.05)
    case .success:
      return .green.opacity(0.05)
    case .warning:
      return .orange.opacity(0.05)
    }
  }
  
  private var borderColor: Color {
    guard isEnabled else {
      return .gray.opacity(0.3)
    }
    
    switch validationState {
    case .default:
      return .gray.opacity(0.3)
    case .error:
      return .red
    case .success:
      return .green
    case .warning:
      return .orange
    }
  }
  
  private var borderWidth: CGFloat {
    switch validationState {
    case .default:
      return 0.6
    default:
      return 1.4
    }
  }
  
  // MARK: - Init
  
  public init(_ textHint: String = "", text: Binding<String>) {
    self.textHint = textHint
    self.text = text
  }
  
  // MARK: - Body
  
  public var body: some View {
    HStack(spacing: .paddingMedium) {
      if let leadingIcon {
        leadingIcon
          .sizeAsIcon()
          .foregroundStyle(iconColor)
      }
      
      VStack(spacing: .paddingSmall) {
        if let title {
          Text(title)
            .font(.body)
            .fontWeight(.medium)
            .foregroundStyle(iconColor)
        }
        
        if variant == .secure {
          SecureField(text: text, prompt: nil) {
            Text(textHint)
              .font(.footnote)
              .foregroundStyle(iconColor.opacity(0.5))
          }
        } else {
          TextField(text: text, prompt: nil) {
            Text(textHint)
              .font(.footnote)
              .foregroundStyle(iconColor.opacity(0.5))
          }
        }
      }
      
      if showClearButton, let onClear {
        Button(action: onClear) {
          Image(systemName: "xmark.circle.fill")
            .sizeAsIcon()
            .foregroundStyle(iconColor)
        }
      } else if let trailingIcon {
        trailingIcon
          .sizeAsIcon()
          .foregroundStyle(iconColor)
      }
    }
    .foregroundStyle(isEnabled ? .black : .gray)
    .padding(.paddingLarge)
    .background(backgroundColor, in: .rect(cornerRadius: .cornerRadiusLarge))
    .overlay(
      RoundedRectangle(cornerRadius: .cornerRadiusLarge)
        .strokeBorder(borderColor, lineWidth: borderWidth)
    )
    .padding(.horizontal, .screenEdgePadding)
    .padding(.vertical, .paddingSmall)
    .shadow(radius: .shadowRadiusExtraSmall)
  }
}

// MARK: - Modifiers

extension JustTextField {
  public func variant(_ variant: TextFieldVariant) -> Self {
    var textField = self
    textField.variant = variant
    return textField
  }
  
  public func validationState(_ state: TextFieldValidationState) -> Self {
    var textField = self
    textField.validationState = state
    return textField
  }
  
  public func isEnabled(_ isEnabled: Bool) -> Self {
    var textField = self
    textField.isEnabled = isEnabled
    return textField
  }
  
  public func withLeadingIcon(_ icon: Image) -> Self {
    var textField = self
    textField.leadingIcon = icon
    return textField
  }
  
  public func withTrailingIcon(_ icon: Image) -> Self {
    var textField = self
    textField.trailingIcon = icon
    return textField
  }
  
  public func withClearButton(onClear: @escaping () -> Void) -> Self {
    var textField = self
    textField.showClearButton = true
    textField.onClear = onClear
    return textField
  }
  
  public func withTitle(_ title: String?) -> Self {
    var textField = self
    textField.title = title
    return textField
  }
}


// MARK: - Preview

#Preview {
  VStack {
    JustTextField("Enter name", text: .constant(""))
    JustTextField("Disabled", text: .constant(""))
      .disabled(true)
    JustTextField("Disabled", text: .constant(""))
      .withLeadingIcon(Image(systemName: "person"))
      .validationState(.warning)
    JustTextField("Enter name", text: .constant(""))
      .withLeadingIcon(Image(systemName: "person"))
      .variant(.secure)
      .validationState(.success)
    JustTextField("Enter password", text: .constant(""))
      .withLeadingIcon(Image(systemName: "key"))
      .variant(.secure)
      .validationState(.error)
  }
}
