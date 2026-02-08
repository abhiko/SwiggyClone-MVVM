//
//  AppFont.swift
//  Swiggy
//
//  Created by Abhishek Kohli on 28/12/25.
//

import SwiftUI

enum AppFont {

    static func light(_ size: CGFloat) -> Font {
        .custom("Poppins-Light", size: size)
    }

    static func regular(_ size: CGFloat) -> Font {
        .custom("Poppins-Regular", size: size)
    }

    static func medium(_ size: CGFloat) -> Font {
        .custom("Poppins-Medium", size: size)
    }

    static func semibold(_ size: CGFloat) -> Font {
        .custom("Poppins-SemiBold", size: size)
    }

    static func bold(_ size: CGFloat) -> Font {
        .custom("Poppins-Bold", size: size)
    }

    static func extraBold(_ size: CGFloat) -> Font {
        .custom("Poppins-ExtraBold", size: size)
    }

    static func italic(_ size: CGFloat) -> Font {
        .custom("Poppins-Italic", size: size)
    }
}
