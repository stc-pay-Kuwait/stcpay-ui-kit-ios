//
//  Color+Extension.swift
//  ModifiersTest
//
//  Created by Waqas Ahmed on 24/03/2025.
//
import SwiftUI

public enum AppType : Sendable {
    case bahrain
    case kuwait
}

public final class CustomModifiersAppType: @unchecked Sendable {
    public static let shared = CustomModifiersAppType()
    public private(set) var appType: AppType = .bahrain
    private init() {}
    public func setAppType(_ newAppType: AppType) {
        self.appType = newAppType
    }
}

public extension Color {
    static var stPrimaryOsais: Color {
        CustomModifiersAppType.shared.appType == .bahrain ? Color("AccentColor", bundle: .module) : Color("AccentColor", bundle: .module)
        //Color("borderShadow", bundle: .module)
    }
    static var stBorderShadow: Color{
        Color("borderShadow", bundle: .module)
    }
    static var stLightGrey: Color{
        Color("lightGrey", bundle: .module)
    }
    static var tfPlaceholderGray: Color {
        Color("tfPlaceholderGray", bundle: .module)
    }
    static var borderShadow: Color {
        Color("borderShadow", bundle: .module)
    }
    static var textSecondaryGray: Color {
        Color("textSecondaryGray", bundle: .module)
    }
    static var optionsBorderGray: Color {
        Color("optionsBorderGray", bundle: .module)
    }
    static var borderGrayPrimary: Color {
        Color("borderGrayPrimary", bundle: .module)
    }
    static var darkGrayTitleColor: Color {
        Color("darkGrayTitleColor", bundle: .module)
    }
    static var grayIconColor: Color {
        Color("grayIconColor", bundle: .module)
    }
}


//Without bundle: .module, SwiftUI will look in the main app bundle, not the package.
