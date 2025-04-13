//
//  RadioOptionsView.swift
//  TestSPMViews
//
//  Created by Waqas Ahmed on 06/04/2025.
//

import SwiftUI

public struct RadioOptionsView: View {
    let title: String
    let id: String
    @Binding var selectedID: String?
    let radioPosition: RadioPosition
    
    var isSelected: Bool {
        selectedID == id
    }
    
    public init(title: String, id: String, selectedID: Binding<String?>, radioPosition: RadioPosition = .left) {
        self.title = title
        self.id = id
        self._selectedID = selectedID
        self.radioPosition = radioPosition
    }
    
    public var body: some View {
        Button(action: {
            selectedID = id
        }) {
            HStack(alignment: title.isSingleLine ? .center : .firstTextBaseline) {
                
                if radioPosition == .left {
                    radioCircle
                }

                VStack(alignment: .leading, spacing: 4) { // Text container
                    Text(title)
                        .foregroundColor(.textSecondaryGray)
                        .appFont(.stcForward(.regular, size: 16))
                        .padding(.leading, 5)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer()
                
                if radioPosition == .right {
                    radioCircle
                }
            }
        }
    }
    
    @ViewBuilder
    private var radioCircle: some  View {
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

}

//#Preview {
//    @State var selectedRadioID: String?
//    RadioOptionsView(title: "Enable Notifications Enable Notifications Enable Notifications Enable Notifications Enable Notifications Enable Notifications",  id: "option3", selectedID: $selectedRadioID)
//    
//    RadioOptionsView(title: "Enable Notifications",  id: "option3", selectedID: $selectedRadioID, radioPosition: .right)
//    
//}

public enum RadioPosition {
    case left
    case right
}
