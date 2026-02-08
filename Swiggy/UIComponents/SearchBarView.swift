//
//  SearchBarView.swift
//  Swiggy
//
//  Created by Abhishek Kohli on 28/12/25.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var text: String
    @State private var isEditing = false

    var placeholder: String = "Search for restaurants, dishes..."

    var body: some View {
        HStack(spacing: 8) {
        
           // TextField
            TextField(placeholder, text: $text)
                .font(AppFont.regular(20))
                .foregroundColor(.white)
                .disableAutocorrection(true)
                .frame(height: 40)
                .onTapGesture {
                    isEditing = true
                }
            // Search icon
            Image(AppImages.search)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.gray)

            Divider()
                .frame(width: 1, height: 26)
            
            Image(AppImages.voice)
                .resizable()
                .frame(width: 19, height: 27)
                .foregroundColor(.gray)
            
            // Clear button
            if isEditing && !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 10)
        .background(Color(hex: "#F2F2F2"))
        .cornerRadius(27.5)
        .overlay(
            RoundedRectangle(cornerRadius: 27.5)
                .stroke(isEditing ? Color.orange : Color.clear, lineWidth: 1)
        )
        .onTapGesture {
            isEditing = true
        }
    }
}


#Preview {
    @Previewable @State var text = ""
    SearchBarView(text: $text)
}
