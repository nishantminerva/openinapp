//
//  TabBarButton.swift
//  OpeninApp
//
//  Created by Nishant Minerva on 29/03/24.
//

import SwiftUI

struct TabBarButton: View {
    var label: String
    var animation: Namespace.ID
    var image: String
    @Binding var selectedTab: String

    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedTab = image
            }
        }, label: {
            VStack(spacing: 8) {
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
                Text(label)
                    .font(.caption)
            }
            .foregroundColor(selectedTab == image ? Color.black : Color.gray.opacity(0.5))
            .frame(maxWidth: .infinity)
        })
    }
}

