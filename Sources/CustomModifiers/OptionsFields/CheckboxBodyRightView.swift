//
//  CheckboxBodyRightView.swift
//  CustomModifiers
//
//  Created by Waqas Ahmed on 08/04/2025.
//

import SwiftUI

public struct CheckboxBodyRightView: View {
    let title: AttributedString
    @Binding var isSelected: Bool
    
    public init(title: AttributedString, isSelected: Binding<Bool>) {
           self.title = title
           self._isSelected = isSelected
       }
    
    public var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            HStack(alignment: title.description.isSingleLine ? .center : .firstTextBaseline,  spacing: 8) { // Dynamically adjust alignment
                ZStack {
                    Button(action: {
                        isSelected.toggle()
                    }) {
                        ZStack {
                            if !isSelected{
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.textSecondaryGray)
                                    .frame(width: 16, height: 16)
                            }
                            if isSelected {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.stPrimaryOsais)
                                    .frame(width: 16, height: 16)
                                Image("check_icon", bundle: Bundle.module)
                                    .frame(width: 12, height: 12, alignment: .center)
                            }
                        }
                        .offset(y: title.description.isSingleLine ? 0 : 5)
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) { // Text container
                    Text(title)
                        .bodyTextStyle()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    @State var isSelected: Bool = true
    CheckboxBodyRightView(title: "Enable Notifications Enable Notifications Enable Notifications Enable Notifications Enable Notifications Enable Notifications Enable Notifications",  isSelected: $isSelected)
//    CheckboxBodyRightView(title: getCheckBoxAttributedString(),  isSelected: $isSelected)
}

//@MainActor
//func getCheckBoxAttributedString() -> AttributedString {
//    var string = AttributedString("By providing the mobile number, I hereby agree and accept the Terms and Conditions and Privacy Policy")
//    
//    if let range = string.range(of: "Terms and Conditions") {
//        string[range].foregroundColor = .stPrimaryOsais
//        string[range].font = AppFont.stcForward(.bold, size: 13).font
//        string[range].link = URL(string: "t_and_c_url")
//    }
//
//    if let range = string.range(of: "Privacy Policy") {
//        string[range].foregroundColor = .stPrimaryOsais
//        string[range].font = AppFont.stcForward(.bold, size: 13).font
//        string[range].link = URL(string: "t_and_c_url")
//    }
//
//    return string
//}
