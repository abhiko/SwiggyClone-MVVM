//
//  SwiggyApp.swift
//  Swiggy
//
//  Created by Abhishek Kohli on 28/12/25.
//

import SwiftUI

@main
struct SwiggyApp: App {
    
    @StateObject private var navigationManager = AppNavigationManager()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(navigationManager)
        }
    }
}
