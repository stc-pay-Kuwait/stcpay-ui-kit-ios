//
//  SwiftUIView.swift
//  CustomModifiers
//
//  Created by Waqas Ahmed on 08/04/2025.
//

import SwiftUI

struct TrustedDeviceCell: View {
    
    public let deviceName: String
    
    public init(deviceName: String) {
        self.deviceName = deviceName
    }
    
    var body: some View {
        ZStack{
            HStack(spacing: 12){
                HStack(alignment: .center, spacing: 0) {
                    // Add your icon or content here
                    Image("shield_tick", bundle: .module)
                        .frame(width: 28, height: 28)
                }
                .padding(10)
                .frame(width: 48, height: 48, alignment: .center)
                .background(Color.utilityGreen)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 1)
                        .stroke(Color.white.opacity(0.12), lineWidth: 2)
                )
                
                VStack(alignment: .leading, spacing: 8){
                    Text("Your trusted device")
                        .appFont(.stcForward(.medium, size: 15))
                        .foregroundStyle(Color.darkGrayTitleColor)
                    
                    Text(deviceName)
                        .appFont(.stcForward(.regular, size: 15))
                        .foregroundStyle(Color.textSecondaryGray)
                }
                
                Spacer()
            }
            .padding()
        }
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.optionsBorderGray, lineWidth: 1)
        )
    }
}

//#Preview {
//    TrustedDeviceCell(deviceName: "iPhone 16 Pro Max (This Device)")
//}
