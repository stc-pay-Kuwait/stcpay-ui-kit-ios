//
//  IdentityVerificationCell.swift
//  STCPayKuwait
//
//  Created by Waqas Ahmed on 09/04/2025.
//

import SwiftUI

public struct IdentityVerificationCell: View {
    public var identityVerification: IdentityVerification
    public let onTap: (Int) -> Void
    public init(identityVerification: IdentityVerification, onTap: @escaping (Int) -> Void) {
        self.identityVerification = identityVerification
        self.onTap = onTap
    }
    public var body: some View {
        Button(action: {
            onTap(identityVerification.id)
        }){
            ZStack(alignment: .topTrailing) {
                HStack(alignment: .top, spacing: 8) {
                    VStack {
                        Image(identityVerification.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 64)
                            .clipped()
                            .cornerRadius(8)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(identityVerification.title)
                            .appFont(.stcForward(.medium, size: 15))
                            .foregroundColor(Color.darkGrayTitleColor)
                        Text(identityVerification.subtitle)
                            .appFont(.stcForward(.regular, size: 15))
                            .foregroundStyle(Color.textSecondaryGray)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(6)
                            .padding(.top, 2)
                    }
                    
                    Spacer()
                    Image(systemName: "chevron.right")
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color.stPrimaryOsais)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .inset(by: 0.5)
                        .stroke(Color.optionsBorderGray, lineWidth: 1)
                )
                
                if let tagText = identityVerification.tagText, !tagText.isEmpty {
                    Text(tagText)
                        .appFont(.stcForward(.medium, size: 11))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .overlay {
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.purpleBorder, lineWidth: 1.5)
                        }
                        .background(Color.purpleBody)
                        .cornerRadius(6)
                        .offset(x: -24, y: -10)
                }
            }
        }
    }
}

//#Preview {
//    VStack {
//        IdentityVerificationCell(identityVerification: IdentityVerification(id: 0, image: "id_img", title: "ID Proof", subtitle: "Capture a picture of your Kuwait Civil ID carte", tagText: "Faster")) { id in
//            print("Click on list \(id)")
//        }
//        
//        IdentityVerificationCell(identityVerification: IdentityVerification(id: 1,image: "id_card", title: "ID Proof", subtitle: "Capture a picture of your Kuwait Civil ID carte", tagText: nil)){ id in
//            print("Click on list \(id)")
//        }
//    }
//}

public struct IdentityVerification: Identifiable {
    public let id: Int
    public let image: String
    public let title: String
    public let subtitle: String
    public let tagText: String?
    
    public init(id: Int, image: String, title: String, subtitle: String, tagText: String? = nil) {
        self.id = id
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.tagText = tagText
    }
}
