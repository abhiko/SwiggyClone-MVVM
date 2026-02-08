//
//  HomeView.swift
//  Swiggy
//
//  Created by Abhishek Kohli on 28/12/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel
    @State private var searchtext = ""
    @State private var scrollOffset: CGFloat = 0
    
    private let headerHeight: CGFloat = 240
    private let searchBarHeight: CGFloat = 160
    
    init() {
          _viewModel = StateObject(wrappedValue: HomeViewModel())
      }
    //MARK:-  HEADER MOVES UP UNTIL SEARCH BAR STICKS
    private var headerOffset: CGFloat {
        let maxOffset = headerHeight - searchBarHeight
        return -min(scrollOffset, maxOffset)
    }
    
    //MARK:-  SEARCH BAR PIN STATE
    private var isSearchBarPinned: Bool {
        scrollOffset >= (headerHeight - searchBarHeight)
    }
    
    //MARK:-  SCROLL OFFSET TRACKING
    private var offsetReader: some View {
        GeometryReader { geo in
            Color.clear
                .preference(
                    key: ScrollOffsetKey.self,
                    value: geo.frame(in: .global).minY
                )
        }
        .onPreferenceChange(ScrollOffsetKey.self) {
            scrollOffset = max(0, -$0)
        }
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    
                    //MARK:-  Space reserved for header
                    Color.clear
                        .frame(height: headerHeight)
                        .background(offsetReader)
                    
                    HomeContentView()
                        .padding(.horizontal, 16)
                    
                    HomeBottomView()
                }
            }
            
            //MARK:-  HEADER + SEARCH BAR (OUTSIDE SCROLL)
            VStack(spacing: 0) {
                
                //MARK:-  HEADER (ANIMATED HIDE)
                HomeHeaderView()
                    .padding(.horizontal, 23)
                    .padding(.top, 60)
                    .padding(.bottom, 25)
                    .opacity(isSearchBarPinned ? 0 : 1)
                    .offset(y: isSearchBarPinned ? -20 : 0)
                    .animation(.easeOut(duration: 0.25), value: isSearchBarPinned)
                
                //MARK:-  SEARCH BAR (MOVES → STICKS)
                SearchBarView(text: $searchtext)
                    .padding(.horizontal, 23)
                    .padding(.bottom, 12)
            }
            .frame(height: headerHeight)
            .background(
                LinearGradient(
                    colors: [
                        AppColors.gradientOne,
                        AppColors.gradientTwo,
                        AppColors.gradientThree
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
            )
            .offset(y: headerOffset)
            .animation(.easeOut(duration: 0.25), value: scrollOffset)
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    HomeView()
}
