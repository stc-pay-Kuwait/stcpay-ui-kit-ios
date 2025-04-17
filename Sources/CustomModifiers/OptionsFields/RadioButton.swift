//
//  RadioButton.swift
//  ModifiersTest
//
//  Created by Waqas Ahmed on 26/03/2025.
//

import SwiftUI

public struct RadioButton: View {
    let title: String
    let id: String
    @Binding var selectedID: String?
    
    var isSelected: Bool {
        selectedID == id
    }
    
    public init(title: String, id: String, selectedID: Binding<String?>) {
        self.title = title
        self.id = id
        self._selectedID = selectedID
    }
    
    public var body: some View {
        Button(action: {
            selectedID = id
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
                    Circle()
                        .stroke(Color.borderGrayPrimary, lineWidth: 1)
                        .frame(width: 20, height: 20)
                    
                    if isSelected {
                        Circle()
                            .fill(Color.stPrimaryOsais)
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill(Color.white)
                            .frame(width: 8, height: 8)
                    }
                }
                .frame(width: 20, height: 20)
                .offset(y: title.isSingleLine ? 0 : 5)
            }
            .frame(minHeight: 55)
            .padding(.horizontal, 10)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .inset(by: 0.5)
                    .stroke(Color.optionsBorderGray, lineWidth: 1)
            )
        }
    }
}

#Preview {
    @State var selectedRadioID: String?
    RadioButton(title: "Enable Notifications Enable Notifications Enable Notifications Enable Notifications Enable Notifications Enable Notifications Enable Notifications",  id: "option1", selectedID: $selectedRadioID)
    RadioButton(title: "Enable Notifications Enable Notifications Enable Notifications",  id: "option2", selectedID: $selectedRadioID)
    RadioButton(title: "Enable Notifications Enable Notifications",  id: "option3", selectedID: $selectedRadioID)
}
