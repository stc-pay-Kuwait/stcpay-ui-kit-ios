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
            .appFont(.stcForward(.medium, size: 16))
            .foregroundColor(buttonStyle.textColor)
            .padding(padding)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(buttonStyle.backgroundColor)
            .overlay(
                
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(
                        buttonStyle.hasBorder ?
                        AnyShapeStyle(buttonStyle.borderColor) :
                            AnyShapeStyle(LinearGradient(
                            gradient: Gradient(colors: [
                                Color.white.opacity(0.12), // 12% opacity
                                Color.white.opacity(0.0)   // 0% opacity
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )),
                        lineWidth: buttonStyle.hasBorder ? 1 : 2
                    )
            )
            .cornerRadius(cornerRadius)
            .opacity(buttonStyle.buttonOpacity)
            .shadow(
                color: buttonStyle.shadowColor.opacity(0.05), // Shadow color with opacity
                radius: buttonStyle.shadowRadius, // Shadow blur radius
                x: 0, y: 1 // Shadow position (from Figma: X=0, Y=1)
            )
    }
}

public extension View {
    func primaryButtonStyles(_ style: ButtonStyles, cornerRadius: CGFloat = 8, padding: CGFloat = 10) -> some View {
        self.modifier(PrimaryButtonModifier(buttonStyle: style, cornerRadius: cornerRadius, padding: padding))
    }
}
