//
//  RectangleButtonView.swift
//  OpeninApp
//
//  Created by Nishant Minerva on 28/03/24.
//

import SwiftUI

struct RectangleButtonView: View {
    
    let alignmentCenter: Bool
    let icon: String
    let text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .stroke(style: StrokeStyle())
            .overlay{
                HStack {
                    HStack{
                        Image(icon)
                            .resizable()
                            .frame(width: 19, height: 19)
                        Text(text)
                    }
                    .foregroundStyle(.black)
                    if !alignmentCenter {
                        Spacer()
                    }
                }
                .padding()
                
            }
        
            .frame(width: 328, height: 48)
            .foregroundStyle(Color(hex: 0xD8D8D8))
    }
}
