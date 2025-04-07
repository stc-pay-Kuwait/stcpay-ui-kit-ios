//
//  CustomNavBar.swift
//  TestSPMViews
//
//  Created by Waqas Ahmed on 06/04/2025.
//

import SwiftUI
public struct CustomNavBar: View {
    public var showBackButton: Bool
    public var onBack: (() -> Void)?
    public var showOptionsButton: Bool
    public var onMenuIconTap: (() -> Void)?
    
    public init(
        showBackButton: Bool = false,
        onBack: (() -> Void)? = nil,
        showOptionsButton: Bool = false,
        onMenuIconTap: (() -> Void)? = nil
    ) {
        self.showBackButton = showBackButton
        self.onBack = onBack
        self.showOptionsButton = showOptionsButton
        self.onMenuIconTap = onMenuIconTap
    }
    
    public var body: some View {
        VStack{
            HStack {
                if showBackButton {
                    Button(action: { onBack?() }) {
                        Image(systemName: "arrow.left")
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.grayIconColor)
                    }
                } else {
                    Spacer().frame(width: 20)
                }
                
                Spacer()
                
                if showOptionsButton {
                    Button{
                        onMenuIconTap?()
                    }label: {
                        Image(systemName: "ellipsis")
                            .frame(width: 20, height: 20)
                            .rotationEffect(.degrees(90))
                            .foregroundColor(Color.grayIconColor)
                    }
                } else {
                    Spacer().frame(width: 20)
                }
            }.frame(width: .infinity, height: 20)
        }
    }
}
