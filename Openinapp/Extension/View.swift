//
//  View.swift
//  OpeninApp
//
//  Created by Nishant Minerva on 28/03/24.
//

import SwiftUI



// Extending view to get safe area..
extension View {
    var safeArea: UIEdgeInsets {
        UIApplication.shared.windows.first?.safeAreaInsets ?? .zero
    }
}


extension View {
    var rect: CGRect {
        UIScreen.main.bounds
    }
}


// for setting specific corners
extension View{
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner)-> some View{
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}


struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
