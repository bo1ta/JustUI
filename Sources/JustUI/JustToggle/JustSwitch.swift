//
//  JustSwitch.swift
//  JustUI
//
//  Created by Alexandru Solomon on 14.11.2025.
//

import SwiftUI

public struct JustSwitch: View {
  @Binding private var isOn: Bool
  
  public init(isOn: Binding<Bool>) {
    _isOn = isOn
  }
  
  public var body: some View {
    HStack {
      if isOn {
        Spacer()
      }
      
      Circle()
        .fill(.white)
        .onTapGesture {
          withAnimation {
            isOn.toggle()
          }
        }
        .shadow(radius: 1.0)
        .padding(.paddingExtraSmall)
        .animation(.bouncy(duration: 0.2, extraBounce: 0.2), value: isOn)
      
      if !isOn {
        Spacer()
      }
    }
    .background(isOn ? Color.primary : Color.gray.opacity(0.2))
    .animation(.easeInOut(duration: 0.2), value: isOn)
    .clipShape(Capsule())
    .frame(width: 55, height: 30)
  }
}


#Preview {
  @Previewable @State var isOn = false
  JustSwitch(isOn: $isOn)
}
