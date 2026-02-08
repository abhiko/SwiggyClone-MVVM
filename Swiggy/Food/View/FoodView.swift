//
//  FoodView.swift
//  Swiggy
//
//  Created by Abhishek Kohli on 11/01/26.
//

import SwiftUI

struct FoodView: View {
    
    var body: some View {

//        List {
//            Section(header: headerView("Header 1")) {
//                ForEach(0..<20) { i in
//                    Text("Item \(i)")
//                }
//            }
//
//            Section(header: Text("Header 2")) {
//                ForEach(20..<40) { i in
//                    Text("Item \(i)")
//                }
//            }
//        }
//        .listStyle(.plain)

        ScrollView {
            LazyVStack(pinnedViews: [.sectionHeaders]) {

                Section(header: headerView("Header 1")) {
                    ForEach(0..<20) { i in
                        row("Row \(i)")
                    }
                }

                Section(header: headerView("Header 2")) {
                    ForEach(20..<40) { i in
                        row("Row \(i)")
                    }
                }

                Section(header: headerView("Header 3")) {
                    ForEach(40..<60) { i in
                        row("Row \(i)")
                    }
                }
            }
        }
       .ignoresSafeArea(.container, edges: .top)

    }
    
    func headerView(_ title: String) -> some View {
        ZStack {
            Color.white   

            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
        .frame(height: 50)
        .zIndex(1)  // keep it above rows
    }

    func row(_ text: String) -> some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.gray.opacity(0.1))
    }

}

#Preview {
    FoodView()
}
