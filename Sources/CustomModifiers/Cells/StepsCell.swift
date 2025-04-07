//
//  StepsCell.swift
//  CustomModifiers
//
//  Created by Waqas Ahmed on 07/04/2025.
//

import SwiftUI

public struct StepsCell: View {
    public let title: String
    public let subtitle: String
    public let state: StepState
    @State private var subtitleHeight: CGFloat = 0
    
    public init(title: String, subtitle: String, state: StepState) {
        self.title = title
        self.subtitle = subtitle
        self.state = state
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(){
                icon
                    .frame(width: 20, height: 20)
                
                Rectangle()
                    .frame(width: 2)
                    .foregroundColor(Color.optionsBorderGray)
                    .cornerRadius(2)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .appFont(.stcForward(.medium, size: 15))
                    .foregroundColor(textColorTitle)
                
                Text(subtitle)
                    .appFont(.stcForward(.regular, size: 15))
                    .foregroundColor(textColorSubtitle)
            }
            .padding(.top, 4)
            .padding(.bottom)
            .padding(.trailing)
        }
        .frame(height: 72)
        .padding(.vertical, 5)
    }
    
    public var icon: some View {
        Group {
            switch state {
            case .checked:
                Image("step_icon_checked", bundle: .module)
            case .current:
                Image("step_icon_present", bundle: .module)
            case .disabled:
                Image("step_icon_disabled", bundle: .module)
            }
        }
    }
    
    private var textColorTitle: Color {
        switch state {
        case .checked, .disabled:
            return Color.tfPlaceholderGray
        case .current:
            return Color.darkGrayTitleColor
        }
    }
    
    private var textColorSubtitle: Color {
        switch state {
        case .checked, .disabled:
            return Color.tfPlaceholderGray
        case .current:
            return Color.textSecondaryGray
        }
    }
}

//#Preview {
//    VStack(alignment: .leading, spacing: 0) {
//        StepsCell(
//            title: "Create your stc pay account",
//            subtitle: "Verify phone number & set passcode Verify phone number & set passcode Verify phone number & set passcode ",
//            state: .checked
//        )
//      //  Divider()
//        StepsCell(
//            title: "Title",
//            subtitle: "subtitle",
//            state: .current
//        )
//      //  Divider()
//        StepsCell(
//            title: "Answer simple questions",
//            subtitle: "Provide further details about yourself",
//            state: .disabled
//        )
//    }
//    .padding()
//}


public enum StepState {
    case checked
    case current
    case disabled
}
