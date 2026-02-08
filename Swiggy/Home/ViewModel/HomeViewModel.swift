//
//  HomeViewModel.swift
//  Swiggy
//
//  Created by Abhishek Kohli on 11/01/26.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var leftColumn: [HomeCardModel] = []
    @Published var rightColumn: [HomeCardModel] = []
    @Published var modelData: [HomeCardModel] = []

    init() {
        loadCardModel()
    }
}


extension HomeViewModel {
    
    func loadCardModel()  {
        let model = [HomeCardModel(
                     title: "FOOD DELIVERY",
                     subtitle: "FROM RESTAURANTS",
                     offerTitle: "UP TO 60% OFF & FREE DEL",
                     image: AppImages.foodDelivery,
                     style: .largeImage),
                     
                     HomeCardModel(
                        title: "INSTAMART",
                        subtitle: "GET ANYTHING INSTANTLY",
                        offerTitle: "FREE DEL AT  99",
                        image: AppImages.instamartCard,
                        style: .smallImage) ,
                     
                     HomeCardModel(
                        title: "DINEOUT",
                        subtitle: "EAT OUT & SAVE MORE",
                        offerTitle: "UP TO 50% OFF",
                        image: AppImages.foodDelivery,
                        style: .largeImage) ,
                     
                     HomeCardModel(
                        title: "GENIE",
                        subtitle: "PICK-UP & DROP",
                        offerTitle: "",
                        image: AppImages.genie,
                        style: .smallImage),
                      
                     HomeCardModel(
                        title: "MALL",
                        subtitle: "ONLINE SHOPPING",
                        offerTitle: "",
                        image: AppImages.mall,
                        style: .smallImage) ,
                     
                     HomeCardModel(
                        title: "CREDIT CARD",
                        subtitle: "FLAT 10% ON SWIGGY",
                        offerTitle: "",
                        image: "",
                        style: .noImage)
                     
        ]
        modelData = model

    }
}
