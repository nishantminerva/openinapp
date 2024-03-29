//
//  CustomTabBar.swift
//  OpeninApp
//
//  Created by Nishant Minerva on 28/03/24.
//


import SwiftUI

struct CustomeTabBar: View {
    @Binding var selectedTab: String
    // Animation namespace for sliding effect
    @Namespace var animation
    var body: some View {
        HStack(spacing: 0) {
            // Tab Bar Button
            TabBarButton(label: "Links", animation: animation, image: "link", selectedTab: $selectedTab)
            TabBarButton(label: "Courses", animation: animation, image: "Files", selectedTab: $selectedTab)

            Button(action: {}, label: {
                Image("plus")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(Color(hex: 0x0F6FFF))
                    .clipShape(Circle())
                // Shadows..
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
            })
            .offset(y: -30)

            TabBarButton(label: "Campaigns", animation: animation, image: "campaigns", selectedTab: $selectedTab)
            TabBarButton(label: "Profile", animation: animation, image: "user", selectedTab: $selectedTab)
        }
        .padding(.top)
        // Decreasing the extra padding added
        .padding(.vertical, -15)
        .padding(.bottom, safeArea.bottom == 0 ? 15 : safeArea.bottom)
        .background(Color.white)
    }
}

#Preview {
        ContentView()
    }

