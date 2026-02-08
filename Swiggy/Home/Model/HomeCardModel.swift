//
//  HomeCardModel.swift
//  Swiggy
//
//  Created by Abhishek Kohli on 11/01/26.
//

import Foundation

struct HomeCardModel: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let offerTitle: String
    let image: String
    let style: HomeCardStyle
}

enum HomeCardStyle {
    case largeImage
    case smallImage
    case noImage
}
