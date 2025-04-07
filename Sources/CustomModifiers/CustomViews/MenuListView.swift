//
//  Untitled.swift
//  TestSPMViews
//
//  Created by Waqas Ahmed on 06/04/2025.
//
import Foundation
import SwiftUI
public struct MenuListView: View {
    public var title: String = "Menu"
    public let items: [MenuItem]
    public let onSelect: (MenuItem) -> Void
    public let onDismiss: () -> Void

    public init(
        title: String = "Menu",
        items: [MenuItem],
        onSelect: @escaping (MenuItem) -> Void,
        onDismiss: @escaping () -> Void
    ) {
        self.title = title
        self.items = items
        self.onSelect = onSelect
        self.onDismiss = onDismiss
    }

    public var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack(alignment: .top) {
                Text(title)
                    .appFont(.stcForward(.medium, size: 18))
                    .foregroundColor(Color.darkGrayTitleColor)
                
                Spacer()
                
                    Button(action: onDismiss) {
                        Image("cross_icon", bundle: .module)
                            .resizable()
                            .frame(width: 12, height: 12)
                    }
            }
            .padding(20)

            Divider()

            // List items
            ForEach(items) { item in
                Button(action: {
                    onSelect(item)
                }) {
                    HStack(spacing: 12) {
                        Image(item.iconName)
                            .resizable()
                            .frame(width: 24, height: 24)
                        
                        Text(item.title)
                            .appFont(.stcForward(.medium, size: 16))
                            .foregroundColor(Color.grayIconColor)
                        
                        Spacer()
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                }
                Divider()
            }
        }
        .background(Color.white)
    }
}

#Preview {
    MenuListView(items: [MenuItem(title: "Support", iconName: "error_icon"), MenuItem(title: "System", iconName: "error_icon"), MenuItem(title: "Error", iconName: "error_icon"), MenuItem(title: "Warning", iconName: "error_icon")]) { item in
        print("Clicked item \(item.title)")
    } onDismiss: {
        print("Dismiss Tapped")
    }

}

public struct MenuItem: Identifiable, Hashable {
    public let id = UUID()
    public let title: String
    public let iconName: String

    public init(title: String, iconName: String) {
        self.title = title
        self.iconName = iconName
    }
}
