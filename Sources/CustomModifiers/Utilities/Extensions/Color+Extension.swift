//
//  Color+Extension.swift
//  ModifiersTest
//
//  Created by Waqas Ahmed on 24/03/2025.
//
import SwiftUI

public extension Color {
    static var stPrimaryOsais: Color {
        Color("AccentColor", bundle: .module)
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
}


//Without bundle: .module, SwiftUI will look in the main app bundle, not the package.
