//
//  Home.swift
//  Openinapp
//
//  Created by Nishant Minerva on 29/03/24.
//

import SwiftUI

struct Home: View {
    @ObservedObject var model = ViewModel()
    
    // Hiding tab bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var selectedTab: String = "links"
    
    var body: some View {
        VStack(spacing: 0) {
            // Tab view
            TabView {
                LinksView(apiResponseData: model.openinappdata)
                    .tag("links")
                Color.pink
                    .tag("courses")
                Color.yellow
                    .tag("campaigns")
                Color.red
                    .tag("profile")
            }
            // Custom tab bar
            CustomeTabBar(selectedTab: $selectedTab)
        }
            .onAppear{
                Task{
                    await model.getRequest()
                }
            }
    }
    
}

#Preview {
    Home()
}
