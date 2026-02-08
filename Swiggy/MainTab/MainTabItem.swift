//
//  MainTabItem.swift
//  Swiggy
//
//  Created by Abhishek Kohli on 28/12/25.
//

import Foundation
import SwiftUI

enum MainTabItem: CaseIterable {
    case home
    case food
    case instamart
    case dineout
    case card
    case reorder
    
    var tabTitle: String {
        switch self {
        case .home: return "Home"
        case .food: return "Food"
        case .instamart: return "Instamart"
        case .dineout: return "Dineout"
        case .card: return "Card"
        case .reorder: return "Reorder"
        }
    }
    
    var tabImageName: String {
        switch self {
        case .home: return AppImages.home
        case .food: return AppImages.food
        case .instamart: return AppImages.instamart
        case .dineout: return AppImages.dineout
        case .card: return AppImages.card
        case .reorder: return AppImages.reorder
        }
    }
    
    @ViewBuilder
    var rootView: some View {
        switch self {
        case .home: HomeView()
        case .food: HomeView()
        case .instamart: HomeView()
        case .dineout: HomeView()
        case .card: HomeView()
        case .reorder: HomeView()
        }
    }
}
