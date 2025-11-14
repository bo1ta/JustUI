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

  public init(_ textHint: String = "", text: Binding<String>) {
    self.textHint = textHint
    self.text = text
  }

  public var body: some View {
    TextField(textHint, text: text)
      .padding(.paddingLarge)
      .background(Color.white, in: .rect(cornerRadius: .cornerRadiusLarge))
      .shadow(radius: .shadowRadiusSmall)
      .padding(.horizontal, .screenEdgePadding)
      .padding(.vertical, .paddingSmall)
  }
}

#Preview {
  JustTextField("Enter name", text: .constant(""))
}
