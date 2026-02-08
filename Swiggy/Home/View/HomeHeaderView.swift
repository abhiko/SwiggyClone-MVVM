//
//  HomeHeaderView.swift
//  Swiggy
//
//  Created by Abhishek Kohli on 10/01/26.
//

import SwiftUI

struct HomeHeaderView: View {
    
    var body: some View {
        HStack(spacing: 36) {
            
            VStack(alignment: .leading, spacing: 0) {
                
                HStack {
                    Image(AppImages.location)
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("Home")
                        .font(AppFont.extraBold(20))
                    
                    Image(AppImages.downArrow)
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Spacer()
                }
                
                Text("XYZ Mumbai")
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .font(AppFont.medium(15))
            }
            
            Button { } label: {
                Image(AppImages.onebackground)
                    .resizable()
                    .frame(width: 93, height: 50)
                    .overlay(
                        Text("One")
                            .font(AppFont.extraBold(24))
                            .foregroundColor(.orange)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 5)
                    )

            }
            
            Button { } label: {
                Image(AppImages.profile)
                    .resizable()
                    .frame(width: 35, height: 35)
                    .background {
                        Color(AppColors.darkGray)
                            .frame(width: 47, height: 47)
                            .cornerRadius(23.5)
                    }
            }
        }
    }
}

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


#Preview {
    HomeHeaderView()
}
