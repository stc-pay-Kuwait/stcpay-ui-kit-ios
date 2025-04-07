//
//  AppFonts.swift
//  ModifiersTest
//
//  Created by Waqas Ahmed on 24/03/2025.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#endif
public enum AppFont {
   public enum Weight: String {
        case regular = "Regular"
        case bold = "Bold"
        case boldItalic = "BoldItalic"
        case extraBold = "ExtraBold"
        case extraBoldItalic = "ExtraBoldItalic"
        case italic = "Italic"
        case medium = "Medium"
        case mediumItalic = "MediumItalic"
        case light = "Light"
        case lightItalic = "LightItalic"
        case thin = "Thin"
        case thinItalic = "ThinItalic"
    }

  case stcForward(AppFont.Weight, size: Int)

   public var font: Font {
        switch self {
        case .stcForward(let weight, size: let size):
            return Font.custom("STCForward-\(weight.rawValue)", size: CGFloat(size))
        }
    }
}

extension Text {
   public func appFont(_ font: AppFont) -> Text {
        self.font(font.font)
    }
}

extension View {
    public func appFont(_ font: AppFont) -> some View {
        self.font(font.font)
    }
}
