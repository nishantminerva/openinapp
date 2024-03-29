//
//  CustomSegmentPickerView.swift
//  OpeninApp
//
//  Created by Nishant Minerva on 28/03/24.
//

import SwiftUI

struct CustomSegmentPickerView: View {
    @Binding var selectedIndex: Int
    @State private var hoverIndex = 0
    @State private var dragOffset: CGFloat = 0
    @State private var optionWidth: CGFloat = 0
    @State private var totalSize: CGSize = .zero
    @State private var isDragging: Bool = false
    let titles: [String]
    
    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .fill(Color.accentColor)
                .padding(isDragging ? 2 : 0)
                .frame(width: optionWidth, height: totalSize.height)
                .offset(x: dragOffset)
            
                .animation(.spring(), value: dragOffset)
                .animation(.spring(), value: isDragging)
            
            Capsule().fill(Color.clear).opacity(0.2)
                .padding(-4)
            
            HStack(spacing: 0) {
                ForEach(titles.indices, id: \.self) { index in
                    Text(titles[index])
                        .frame(width: optionWidth, height: totalSize.height, alignment: .center)
                        .foregroundColor(hoverIndex == index ? .white : Color(hex: 0x999CA0))
                        .animation(.easeInOut, value: hoverIndex)
                        .font(.system(size: 16, weight: .semibold))
                    
                        .contentShape(Capsule())
                        .onTapGesture {
                            selectedIndex = index
                            hoverIndex = index
                        }.allowsHitTesting(selectedIndex != index)
                }
            }
            .onChange(of: hoverIndex) {
                dragOffset =  CGFloat(hoverIndex) * optionWidth
            }
            .onChange(of: selectedIndex) {
                hoverIndex = selectedIndex
            }
            .frame(width: totalSize.width, alignment: .leading)
        }
        .background(GeometryReader { proxy in Color.clear.onAppear { totalSize = proxy.size } })
        .onChange(of: totalSize) { optionWidth = totalSize.width/CGFloat(titles.count) }
        .onAppear { hoverIndex = selectedIndex }
        .frame(height: 36)
//        .padding([.leading, .trailing], 10)
    }
}

struct CustomSegmentPickerViewPreview: View {
    @State private var selectedIndex = 0
    var titles = ["Top Links", "Recent Links"]
    var body: some View {
        HStack {
            CustomSegmentPickerView(selectedIndex: $selectedIndex, titles: titles)      
            Text("\(selectedIndex)")
            
        }
        .frame(width: 300)
        .padding()
    }
}

#Preview{
    CustomSegmentPickerViewPreview()
}
