//
//  ToggleView.swift
//  ModifiersTest
//
//  Created by Waqas Ahmed on 26/03/2025.
//

import SwiftUI

public struct ToggleView: View {
    let title: String
    @Binding var isOn: Bool
    
    public init(title: String, isOn: Binding<Bool>) {
           self.title = title
           self._isOn = isOn
       }
    
    public var body: some View {
        Button(action: {
            isOn.toggle()
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
                
                Button(action: {
                    isOn.toggle()  // Update state
                }) {
                    HStack {
                                                
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(isOn ? Color.stPrimaryOsais : Color.gray.opacity(0.3))
                                .frame(width: 40, height: 20)
                            
                            Circle()
                                .fill(Color.white)
                                .frame(width: 18, height: 18)
                                .offset(x: isOn ? 10 : -10)
                                .animation(.easeInOut(duration: 0.2), value: isOn)
                        }
                    }
                    //.padding()
                }
                .buttonStyle(PlainButtonStyle())
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
//    @Previewable @State var isOn = false
//    ToggleView(title: "Enable Notifications Enable Notifications Enable Notifications Enable Notifications Enable Notifications Enable Notifications Enable Notifications",  isOn: $isOn)
//    ToggleView(title: "Enable Notifications",  isOn: $isOn)
//}
