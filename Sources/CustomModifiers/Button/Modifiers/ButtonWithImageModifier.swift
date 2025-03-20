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
