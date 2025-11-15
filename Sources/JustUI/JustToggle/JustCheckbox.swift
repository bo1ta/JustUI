//
//  JustCheckbox.swift
//  JustUI
//
//  Created by Alexandru Solomon on 14.11.2025.
//

import SwiftUI

public struct JustCheckbox: View {
  @Binding private var isChecked: Bool

  public init(isChecked: Binding<Bool>) {
    self._isChecked = isChecked
  }

  public var body: some View {
    Image(systemName: "checkmark")
      .font(.justLabel)
      .foregroundColor(.white)
      .opacity(isChecked ? 1 : 0)
      .padding(6)
      .background(isChecked ? Color.accentColor : Color.white, in: .rect(cornerRadius: .cornerRadiusSmall))
      .overlay {
        RoundedRectangle(cornerRadius: 1)
          .strokeBorder(Color.gray.opacity(0.2), lineWidth: 1)
      }
      .shadow(radius: 0.5)
      .onTapGesture {
        isChecked.toggle()
      }
  }
}
