//
//  AppFonts.swift
//  ModifiersTest
//
//  Created by Waqas Ahmed on 24/03/2025.
//

import SwiftUI
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
        _ = FontRegistrationBootstrapper.shared
        return self.font(font.font)
    }
}

extension View {
    public func appFont(_ font: AppFont) -> some View {
        _ = FontRegistrationBootstrapper.shared
        return self.font(font.font)
    }
}


public enum FontRegistrar {
    public static func registerFont(named name: String, withExtension ext: String = "ttf") {
        guard let url = Bundle.module.url(forResource: name, withExtension: ext) else {
            print("⚠️ Font file not found: \(name).\(ext)")
            return
        }
        
        guard let dataProvider = CGDataProvider(url: url as CFURL),
              let font = CGFont(dataProvider) else {
            print("⚠️ Could not create CGFont from: \(name)")
            return
        }
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            let errorDesc = error?.takeUnretainedValue().localizedDescription ?? "Unknown error"
            print("⚠️ Failed to register font: \(name). Error: \(errorDesc)")
        }
    }
    
    public static func registerFonts() {
        let fontNames = [
            "STCForward-Regular",
            "STCForward-Medium",
            "STCForward-Bold"
        ]
        
        for fontName in fontNames {
            registerFont(named: fontName)
        }
    }
}

//This class for regiteration the font in views. 
final class FontRegistrationBootstrapper : @unchecked Sendable {
    static let shared: FontRegistrationBootstrapper = {
        FontRegistrar.registerFonts()
        return FontRegistrationBootstrapper()
    }()
}
