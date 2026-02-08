//
//  MainTabView.swift
//  Swiggy
//
//  Created by Abhishek Kohli on 28/12/25.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var navigationManager: AppNavigationManager
    
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationStack(path: navigationManager.path(for: navigationManager.selectedTab)) {
                navigationManager.selectedTab.rootView
            }
            
            // Custom TabBar
            CustomTabBarView(selectedTab: $navigationManager.selectedTab)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
}
