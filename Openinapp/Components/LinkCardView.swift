//
//  LinkCardView.swift
//  OpeninApp
//
//  Created by Nishant Minerva on 28/03/24.
//


import SwiftUI

struct LinkCardView: View {
    
    let imageUrl: URL
    let link: String
    let totalClicks: Int
    var date: String
    let title: String
    
    var body: some View {
        VStack{
            HStack{
                AsyncImage(
                    url: imageUrl,
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                
                
                VStack(alignment: .leading){
                    Text(title)
                        .font(.system(size: 14))
                        .lineLimit(2)
                    Text("\(formatDate(dateString: date))")
                        .font(.system(size: 12, weight: .thin))
                        .foregroundStyle(Color(hex: 0x9A9C9F))
                }
                Spacer()
                VStack{
                    Text("\(totalClicks)")
                        .font(.system(size: 14))
                        .bold()
                    Text("Clicks")
                        .font(.system(size: 12, weight: .thin))
                        .foregroundStyle(Color(hex: 0x9A9C9F))
                }
                
            }
            .frame(width: 294)
            .padding()
            Button{
                
            } label: {
                RoundedRectangle(cornerRadius: 5)
                    .strokeBorder(style: StrokeStyle(lineWidth: 0.5, dash: [3]))
                    .frame(width: 328, height: 40)
                    .background(Color(hex: 0xE8F1FF))
                    .foregroundStyle(.blue)
                    .overlay{
                        HStack{
                            Text(link)
                            Spacer()
                            Image("filessmall")
                        }
                        .foregroundStyle(Color(hex: 0x0D70FF))
                        .padding()
                    }
            }
        }
        .background(.white)
        .cornerRadius(5.0)
    }
    
    func formatDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let date = dateFormatter.date(from: dateString) else {
            return "Invalid date format"
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: date)
    }
}



#Preview {
    ContentView()
}
