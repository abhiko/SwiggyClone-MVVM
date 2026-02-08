//
//  HomeContentView.swift
//  Swiggy
//
//  Created by Abhishek Kohli on 11/01/26.
//

import SwiftUI

struct HomeContentView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            
            // LEFT COLUMN (Large cards)
            VStack(spacing: 12) {
                ForEach(viewModel.modelData.filter { $0.style == .largeImage }) { item in
                    CardView(model: item)
                }
            }
            
            // RIGHT COLUMN (Small / No image cards)
            VStack(spacing: 12) {
                ForEach(viewModel.modelData.filter { $0.style != .largeImage }) { item in
                    CardView(model: item)
                }
            }
            
        }
    }
}

#Preview {
    HomeContentView()
}

struct CardView: View {
    let model: HomeCardModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            VStack(alignment: .leading, spacing: 0) {
                if !model.offerTitle.isEmpty {
                Text(model.title)
                    .font(AppFont.extraBold(18))
                    .foregroundColor(AppColors.darkGray)
                    .padding(.top, 12)
                
                    Text(model.subtitle)
                        .font(AppFont.medium(11))
                        .foregroundColor(AppColors.darkGray)
                        .padding(.bottom, 12)
                    
                    Text(model.offerTitle)
                        .font(AppFont.semibold(10))
                        .foregroundColor(.orange)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.orange.opacity(0.15))
                        .cornerRadius(12)
                    
                    if !model.image.isEmpty {
                        HStack {
                            Spacer()
                            imageView
                        }
                    }
                } else {
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(model.title)
                                .font(AppFont.extraBold(18))
                                .foregroundColor(AppColors.darkGray)
                                .padding(.top, 12)
                            Text(model.subtitle)
                                .font(AppFont.medium(11))
                                .foregroundColor(AppColors.darkGray)
                                .padding(.bottom, 12)
                        }
                        Spacer(minLength: 0)
                        imageView
                    }
                }
            }
            .padding(.leading, 16)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.1), radius: 6, y: 4)
        )
    }
    
    @ViewBuilder
    private var imageView: some View {
        switch model.style {

        case .largeImage:
            Image(model.image)
                .resizable()
                .scaledToFit()
                .frame(height: 160)

        case .smallImage:
            Image(model.image)
                .resizable()
                .scaledToFit()
                .frame(width: !model.offerTitle.isEmpty ? 150 : 68, height: !model.offerTitle.isEmpty ? 100 : 80)

        case .noImage:
            EmptyView()
        }
    }
}


