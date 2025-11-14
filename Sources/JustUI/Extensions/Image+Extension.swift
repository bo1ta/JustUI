//
//  Image+Extension.swift
//  JustUI
//
//  Created by Alexandru Solomon on 14.11.2025.
//

import SwiftUI

extension Image {
  public func sizeAsIcon() -> some View {
    self
      .renderingMode(.template)
      .resizable()
      .scaledToFit()
      .frame(height: .iconSizeSmall)
  }
}
