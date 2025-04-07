//
//  TextModifiers.swift
//  CustomModifiers
//
//  Created by Waqas Ahmed on 07/04/2025.
//

import SwiftUI
public struct TitleTextModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .appFont(.stcForward(.medium, size: 24))
            .foregroundColor(Color.darkGrayTitleColor)
            .multilineTextAlignment(.leading)
    }
}

public struct SubtitleTextModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .appFont(.stcForward(.regular, size: 16))
            .foregroundColor(Color.grayIconColor)
            .multilineTextAlignment(.leading)
    }
}


 public extension View {
     func titleTextStyle() -> some View {
        self.modifier(TitleTextModifier())
    }

     func subtitleTextStyle() -> some View {
        self.modifier(SubtitleTextModifier())
    }
}
