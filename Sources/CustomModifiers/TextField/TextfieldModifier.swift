//
//  TextfieldModifier.swift
//  AppButton
//
//  Created by Waqas Ahmed on 20/03/2025.
//

import SwiftUI
public struct TextfieldModifier: ViewModifier{
    var textFieldStyle: TextFieldStyles
    var cornerRadius: CGFloat
    var padding: CGFloat
    var iconLeft: Image?
    var iconRight: Image?
    public func body(content: Content) -> some View {
        
        HStack{
            if let iconLeft = iconLeft{
                iconLeft
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundColor(textFieldStyle.textColor)
                    .lineLimit(1)
                    .padding(.leading, 16)
            }
            content
                .foregroundColor(textFieldStyle.textColor)
                .appFont(.stcForward(.regular, size: 16))
                .padding(.leading, (iconLeft == nil) ? 16 : 2)
                //.padding()
                .frame(height: 50)
            
            if let iconRight = iconRight{
                iconRight
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundColor(textFieldStyle.textColor)
                    .lineLimit(1)
                    .padding(.trailing, 16)
            }
        }
        .background(textFieldStyle.backgroundColor)
        .cornerRadius(cornerRadius)
        .shadow(color: .borderShadow.opacity(0.05), radius: 2, x: 0, y: 1)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(textFieldStyle.borderColor, lineWidth: 1)
        )
    }
}

public extension View{
    func textFieldModifier(
        _ style: TextFieldStyles,
        cornerRadius: CGFloat = 8,
        padding: CGFloat = 10,
        iconLeft: Image? = nil,
        iconRight: Image? = nil
    ) -> some View {
        modifier(TextfieldModifier(
            textFieldStyle: style,
            cornerRadius: cornerRadius,
            padding: padding,
            iconLeft: iconLeft,
            iconRight: iconRight
        ))
    }
}

public extension Text{
    func promptTextModifier() -> Text {
        self
            .appFont(.stcForward(.regular, size: 16))
            .foregroundColor(Color.tfPlaceholderGray)
    }
}

