//
//  Color+Ext.swift
//  Swiggy
//
//  Created by Abhishek Kohli on 28/12/25.
//

import SwiftUI

extension Color {

    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let r, g, b, a: UInt64
        switch hex.count {
        case 6: // RGB (24-bit)
            (r, g, b, a) = (int >> 16 & 0xFF,
                            int >> 8 & 0xFF,
                            int & 0xFF,
                            0xFF)
        case 8: // ARGB (32-bit)
            (r, g, b, a) = (int >> 16 & 0xFF,
                            int >> 8 & 0xFF,
                            int & 0xFF,
                            int >> 24 & 0xFF)
        default:
            (r, g, b, a) = (0, 0, 0, 0xFF)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
