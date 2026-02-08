//
//  CustomTabBarView.swift
//  Swiggy
//
//  Created by Abhishek Kohli on 28/12/25.
//

import SwiftUI

struct CustomTabBarView: View {

    @Binding var selectedTab: MainTabItem

    var body: some View {
        HStack(spacing: 0) {
            ForEach(MainTabItem.allCases, id: \.self) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    VStack(spacing: 4) {
                        
                        Image(tab.tabImageName)
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 20, height: 20)
                            .foregroundColor(selectedTab == tab ? .orange : .gray)

                        Text(tab.tabTitle)
                            .font(AppFont.semibold(10))
                            .foregroundColor(selectedTab == tab ? .orange : .gray)
                    }
                    .padding(.horizontal, 4)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.bottom, 0)
        .background(
            Color.white
                .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: -2)
                .edgesIgnoringSafeArea(.bottom)
        )
    }
}


#Preview {
    CustomTabBarView(selectedTab: .constant(.home))
}
