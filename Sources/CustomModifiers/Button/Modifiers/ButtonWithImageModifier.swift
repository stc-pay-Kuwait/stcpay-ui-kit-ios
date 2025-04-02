//
//  ButtonWithImageModifier.swift
//  AppButton
//
//  Created by Waqas Ahmed on 20/03/2025.
//

import SwiftUI
public struct ButtonWithImageModifier: ViewModifier {
    var buttonStyle: ButtonStyles
    var cornerRadius: CGFloat
    var padding: CGFloat
    var image: Image?
    var imagePosition: ImagePosition = .left
    
    public func body(content: Content) -> some View {
        
        Button(action: {}) {
            HStack {
                if imagePosition == .left, let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(buttonStyle.textColor)
                        .padding(3)
                }
                
                content
                    .appFont(.stcForward(.medium, size: 16))
                    .foregroundColor(buttonStyle.textColor)
                
                if imagePosition == .right, let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(buttonStyle.textColor)
                        .padding(3)
                }
            }
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
}
public extension View {
    func buttonWithImageStyle(_ style: ButtonStyles, image: Image? = nil, imagePosition: ImagePosition = .left, cornerRadius: CGFloat = 10, padding: CGFloat = 10) -> some View
    {
        self.modifier(ButtonWithImageModifier(buttonStyle: style, cornerRadius: cornerRadius, padding: padding, image: image, imagePosition: imagePosition))
    }
}


public enum ImagePosition{
    case left
    case right
}
