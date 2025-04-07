//
//  CheckboxView.swift
//  ModifiersTest
//
//  Created by Waqas Ahmed on 26/03/2025.
//

import SwiftUI

public struct CheckboxView: View {
    let title: String
    @Binding var isSelected: Bool
    
    public init(title: String, isSelected: Binding<Bool>) {
           self.title = title
           self._isSelected = isSelected
       }
    
    public var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            HStack(alignment: title.isSingleLine ? .center : .firstTextBaseline) { // Dynamically adjust alignment
                VStack(alignment: .leading, spacing: 4) { // Text container
                    Text(title)
                        .foregroundColor(.textSecondaryGray)
                        .appFont(.stcForward(.regular, size: 16))
                        .padding()
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer()
                
                ZStack {
                    Button(action: {
                        isSelected.toggle()
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.borderGrayPrimary)
                                .frame(width: 20, height: 20)
                            if isSelected {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.stPrimaryOsais)
                                    .frame(width: 20, height: 20)
                                Image("check_icon", bundle: Bundle.module)
                                    .frame(width: 12, height: 12, alignment: .center)
                                    .foregroundColor(Color.white)
                            }
                        }
                        .frame(width: 20, height: 20)
                        .offset(y: title.isSingleLine ? 0 : 5)
                    }
                }
            }
            .frame(minHeight: 55)
            .padding(.horizontal, 10)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.optionsBorderGray, lineWidth: 1)
            )
        }
    }
}



//#Preview {
//    @Previewable @State var isSelected: Bool = false
//    CheckboxView(title: "Enable Notifications Enable Notifications Enable Notifications Enable Notifications Enable Notifications Enable Notifications Enable Notifications",  isSelected: $isSelected)
//    CheckboxView(title: "Enable Notifications Enable", isSelected: .constant(true))
//    CheckboxView(title: "Enable Notifications Enable Notifications",  isSelected: .constant(true))
//}
