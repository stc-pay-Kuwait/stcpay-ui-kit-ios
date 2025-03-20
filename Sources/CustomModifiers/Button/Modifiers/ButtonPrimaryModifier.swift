//
//  ButtonPrimaryModifier.swift
//  AppButton
//
//  Created by Waqas Ahmed on 20/03/2025.
//

import SwiftUI

public struct PrimaryButtonModifier: ViewModifier {
    var buttonStyle: ButtonStyles
    var cornerRadius: CGFloat
    var padding: CGFloat

    public func body(content: Content) -> some View {
        content
            .foregroundColor(buttonStyle.textColor)
            .padding(padding)
            .frame(maxWidth: .infinity)
            .background(buttonStyle.backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(buttonStyle.hasBorder ? buttonStyle.borderColor : Color.clear, lineWidth: buttonStyle.hasBorder ? 2 : 0)
            )
            .cornerRadius(cornerRadius)
            .opacity(buttonStyle.buttonOpacity)
            .shadow(color: buttonStyle.shadowColor, radius: buttonStyle.shadowRadius, x: 2, y: 2)
    }
}

public extension View {
    func primaryButtonStyles(_ style: ButtonStyles, cornerRadius: CGFloat = 10, padding: CGFloat = 10) -> some View {
        self.modifier(PrimaryButtonModifier(buttonStyle: style, cornerRadius: cornerRadius, padding: padding))
    }
}
