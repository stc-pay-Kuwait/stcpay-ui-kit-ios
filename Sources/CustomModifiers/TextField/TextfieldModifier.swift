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
                    .frame(width: 20, height: 20)
                    .foregroundColor(textFieldStyle.textColor)
                    .lineLimit(1)
                    .padding(.leading, 5)
            }
            content
                .foregroundColor(textFieldStyle.borderColor)
                .padding(.horizontal, 10)
            
            if let iconRight = iconRight{
                iconRight
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(textFieldStyle.textColor)
                    .lineLimit(1)
                    .padding(.trailing, 5)
            }
        }
        .padding()
        .background(Color.clear)
        .overlay (
            RoundedRectangle(cornerRadius: textFieldStyle.borderRadius).stroke(textFieldStyle.borderColor, lineWidth: 1)
        )
        .cornerRadius(cornerRadius)
        
    }
}

public extension View{
    func textFieldModifier(_ style: TextFieldStyles,
        cornerRadius: CGFloat = 5,
                      padding: CGFloat = 5,
                      iconLeft: Image? = nil,
                      iconRight: Image? = nil) -> some View {
        modifier(TextfieldModifier(textFieldStyle: style ,cornerRadius: cornerRadius, padding: padding, iconLeft: iconLeft, iconRight: iconRight))
    }
}
