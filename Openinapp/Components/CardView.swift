//
//  CardView.swift
//  OpeninApp
//
//  Created by Nishant Minerva on 28/03/24.
//

import SwiftUI

struct CardView: View {
    
    let icon: String
    let title: String
    let text: String
    
    var body: some View {
        VStack(alignment: .leading){
            Image(icon)
            Text(title)
                .font(.system(size: 16))
                .bold()
            Text(text)
                .font(.system(size: 14))
                .foregroundStyle(Color(hex: 0x9A9C9F))
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
        .frame(width: 120,height: 120)
    }
}
