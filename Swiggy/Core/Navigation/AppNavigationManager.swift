//
//  AppNavigationManager.swift
//  Swiggy
//
//  Created by Abhishek Kohli on 28/12/25.
//

import SwiftUI
import Combine

final class AppNavigationManager: ObservableObject {

    @Published var selectedTab: MainTabItem = .home

    @Published private var paths: [MainTabItem: NavigationPath] = [
        .home: NavigationPath(),
        .food: NavigationPath(),
        .instamart: NavigationPath(),
        .dineout: NavigationPath(),
        .card: NavigationPath(),
        .reorder: NavigationPath()
    ]

    // MARK: - Push to destination
    func push(_ destination: AppDestination, to tab: MainTabItem? = nil) {
        let targetTab = tab ?? selectedTab
        paths[targetTab]?.append(destination)
        selectedTab = targetTab
    }

    // MARK: - Pop last
       func pop(from tab: MainTabItem? = nil) {
           let targetTab = tab ?? selectedTab
           if var path = paths[targetTab], !path.isEmpty {
               path.removeLast()
               paths[targetTab] = path
           }
       }


    // MARK: - Pop to root
    func popToRoot(of tab: MainTabItem? = nil) {
         let targetTab = tab ?? selectedTab
         paths[targetTab] = NavigationPath()
     }
    
    // MARK: - Binding for NavigationStack
    func path(for tab: MainTabItem) -> Binding<NavigationPath> {
        Binding(
            get: { [weak self] in self?.paths[tab] ?? NavigationPath() },
            set: { [weak self] newValue in self?.paths[tab] = newValue }
        )
    }
}


/// Typed destinations for navigation (per tab)
enum AppDestination: Hashable {
    // Home Tab
    case restaurantDetail(id: Int)
    case offers

    // Search Tab
    case searchResult(query: String)

    // Cart Tab
    case checkout

    // Orders Tab
    case orderDetail(id: String)

    // Profile Tab
    case settings
}
