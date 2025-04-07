//
//  String+Extension.swift
//  CustomModifiers
//
//  Created by Waqas Ahmed on 06/04/2025.
//
import SwiftUI

extension String {
    public var isSingleLine: Bool {
        self.count < 30 
    }
}
