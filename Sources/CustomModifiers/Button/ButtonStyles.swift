//
//  ButtonStyles.swift
//  AppButton
//
//  Created by Waqas Ahmed on 20/03/2025.
//

import SwiftUI
public enum ButtonStyles {
    case filled(background: Color = .stPrimaryOsais, textColor: Color = .white, opacity: Double = 1.0, shadow: Color = .stBorderShadow, radius: CGFloat = 8, borderColor: Color = .stPrimaryOsais)
    case bordered(borderColor: Color = .stPrimaryOsais, textColor: Color = .stPrimaryOsais, background: Color = .white, opacity: Double = 1.0, shadow: Color = .stBorderShadow, radius: CGFloat = 8)
    case disabled(background: Color = .stPrimaryOsais, textColor: Color = .white, opacity: Double = 0.7, shadow: Color = .clear, radius: CGFloat = 5)

    /// Background color based on style
    var backgroundColor: Color {
        switch self {
        case .filled(let background, _, let opacity, _, _, _),
             .bordered(_, _, let background, let opacity, _, _),
             .disabled(let background, _, let opacity, _, _):
            return background.opacity(opacity)
        }
    }

    /// Foreground (text) color
    var textColor: Color {
        switch self {
        case .filled(_, let textColor, _, _, _, _),
             .bordered(_, let textColor, _, _, _, _),
             .disabled(_, let textColor, _, _, _):
            return textColor
        }
    }
    
    // Shadow (button) color
    var shadowColor: Color {
        switch self {
        case .filled(_, _, _, let shadow, _, _),
             .bordered(_, _, _, _, let shadow, _),
             .disabled(_, _, _, let shadow, _):
            return shadow
        }
    }
    
    // Shadow (text) color
    var shadowRadius: CGFloat {
        switch self {
        case .filled(_, _, _, _, let radius, _),
             .bordered(_, _, _, _, _, let radius),
             .disabled(_, _, _, _, let radius):
            return radius
        }
    }

    /// Border color
    var borderColor: Color {
        switch self {
        case .filled(_, _, _, _, _, let borderColor),
             .bordered(let borderColor, _, _, _, _, _): return borderColor
        default: return .clear
        }
    }

    /// Opacity for the button (disabled state handling)
    var buttonOpacity: Double {
        switch self {
        case .filled(_, _, let opacity, _, _, _),
             .bordered(_, _, _, let opacity, _, _),
             .disabled(_, _, let opacity, _, _):
            return opacity
        }
    }

    /// Whether the button should have a border
    var hasBorder: Bool {
        switch self {
        case .bordered: return true
        default: return false
        }
    }
    
}
