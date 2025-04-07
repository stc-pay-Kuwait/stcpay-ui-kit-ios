//
//  CustomTitleBar.swift
//  TestSPMViews
//
//  Created by Waqas Ahmed on 06/04/2025.
//

import SwiftUI

public struct CustomTitleBar: View {
    public var title: String?
    public var subtitle: String?
    
    public init(title: String? = nil, subtitle: String? = nil) {
        self.title = title
        self.subtitle = subtitle
    }
    
    public var body: some View {
        if title != nil || subtitle != nil {
            VStack(alignment: .leading, spacing: 10) {
                if let title = title{
                    Text(title)
                        .titleTextStyle()
                }
                if let subtitle = subtitle{
                    Text(subtitle)
                        .subtitleTextStyle()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

//#Preview {
//    VStack(alignment: .leading, spacing: 10){
//        CustomTitleBar(title: "Enter your mobile number",
//                       subtitle: "A verification code will be sent to the mobile number, A verification code will be sent to the mobile numberA verification code")
//        
//        CustomTitleBar(title: "Enter your mobile number")
//        
//        CustomTitleBar(subtitle: "Enter your mobile number Enter your mobile number")
//        
//    }
//}
