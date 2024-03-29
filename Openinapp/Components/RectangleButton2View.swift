//
//  RectangleButton2View.swift
//  OpeninApp
//
//  Created by Nishant Minerva on 28/03/24.
//

import SwiftUI

struct RectangleButton2View: View {
    
    let alignmentCenter: Bool
    let icon: String
    let text: String
    let strokecolor: UInt
    let bgColor: UInt
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .stroke(style: StrokeStyle())
            .overlay{
                HStack {
                    HStack{
                        Image(icon)
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text(text)
                    }
                    .foregroundStyle(.black)
                    if !alignmentCenter {
                        Spacer()
                    }
                }
                .padding()
                
            }
            .background(Color(hex: bgColor))
            .frame(width: 328, height: 65)
            .foregroundStyle(Color(hex: strokecolor))
    }
}
