//
//  WarningView.swift
//  TestSPMViews
//
//  Created by Waqas Ahmed on 06/04/2025.
//

import SwiftUI

public struct WarningView: View {
    let iconName: String
    let title: String
    let message: String
    
    let primaryButtonTitle: String
    let onPrimary: () -> Void
    
    let secondaryButtonTitle: String?
    let onSecondary: (() -> Void)?
    
    let onDismiss: () -> Void
    
    public init(
        iconName: String,
        title: String,
        message: String,
        primaryButtonTitle: String,
        onPrimary: @escaping () -> Void,
        secondaryButtonTitle: String? = nil,
        onSecondary: (() -> Void)? = nil,
        onDismiss: @escaping () -> Void
    ) {
        self.iconName = iconName
        self.title = title
        self.message = message
        self.primaryButtonTitle = primaryButtonTitle
        self.onPrimary = onPrimary
        self.secondaryButtonTitle = secondaryButtonTitle
        self.onSecondary = onSecondary
        self.onDismiss = onDismiss
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            HStack(alignment: .top) {
                Image(iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                Spacer()
                    Button(action: onDismiss) {
                        Image("cross_icon")
                            .resizable()
                            .frame(width: 12, height: 12)
                    }
            }
                        
            Text(title)
                .appFont(.stcForward(.medium, size: 18))
                .foregroundColor(Color.darkGrayTitleColor)
            
            Text(message)
                .subtitleTextStyle()
            
            VStack(spacing: 12) {
                
                Button(primaryButtonTitle){
                    onPrimary()
                }.primaryButtonStyles(.filled())
                
                if let secondaryTitle = secondaryButtonTitle,
                   let onSecondary = onSecondary {
                    Button(secondaryTitle){
                        onSecondary()
                    }.primaryButtonStyles(.bordered())
                }
            }
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    @State var showPopup: Bool = true
    WarningView(
        iconName: "cross_icon",
        title: "Security Error",
        message: "Your action was successful Your action was successful Your action was successful Your action was successful",
        primaryButtonTitle: "Continue",
        onPrimary: {
            print("Primary tapped")
            showPopup = false
        },
        secondaryButtonTitle: "Cancel",
        onSecondary: {
            print("Secondary tapped")
            showPopup = false
        },
        onDismiss: {
            print("Dismiss tapped")
            showPopup = false
        })
}
