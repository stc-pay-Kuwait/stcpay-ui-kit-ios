//
//  TextFieldStyles.swift
//  AppButton
//
//  Created by Waqas Ahmed on 20/03/2025.
//

import SwiftUI
public enum TextFieldStyles {
    case `default`
    
    var backgroundColor: Color {
        return .white
    }
    
    var borderColor: Color {
        return .borderGrayPrimary
    }
    
    var textColor: Color {
        return .tfPlaceholderGray
    }
    
    var borderRadius: CGFloat {
        return 8
    }
}
