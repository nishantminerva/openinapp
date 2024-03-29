//
//  LinksView.swift
//  OpeninApp
//
//  Created by Nishant Minerva on 28/03/24.
//



struct PlotInfo: Identifiable {
    let id = UUID()
    var x = ""
    var y = 0
    
    static func fetchData() -> [PlotInfo] {
        [
            
            PlotInfo(x:"00:00",y: 1),
            PlotInfo(x:"01:00",y: 0),
            PlotInfo(x:"02:00",y: 2),
            PlotInfo(x:"03:00",y: 0),
            PlotInfo(x:"04:00",y: 0),
            PlotInfo(x:"05:00",y: 0),
            PlotInfo(x:"06:00",y: 0),
            PlotInfo(x:"07:00",y: 0),
            PlotInfo(x:"08:00",y: 0),
            PlotInfo(x:"09:00",y: 0),
            PlotInfo(x:"10:00",y: 0),
            PlotInfo(x:"11:00",y: 0),
            PlotInfo(x:"12:00",y: 0),
            PlotInfo(x:"13:00",y: 0),
            PlotInfo(x:"14:00",y: 0),
            PlotInfo(x:"15:00",y: 0),
            PlotInfo(x:"16:00",y: 0),
            PlotInfo(x:"17:00",y: 0),
            PlotInfo(x:"18:00",y: 0),
            PlotInfo(x:"19:00",y: 0),
            PlotInfo(x:"20:00",y: 0),
            PlotInfo(x:"21:00",y: 0),
            PlotInfo(x:"22:00",y: 0),
            PlotInfo(x:"23:00",y: 0)
            
        ]
    }
}




import SwiftUI
import Charts

struct LinksView: View {
    
    @State private var plots = PlotInfo.fetchData()
    
    var apiResponseData: Data
    
    @State private var selectedIndex = 0
    
    var titles = ["Top Links", "Recent Links"]
    
    let linearGradient = LinearGradient(gradient: Gradient(colors: [Color.accentColor.opacity(0.4),Color.accentColor.opacity(0)]),startPoint: .top,endPoint: .bottom)
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack{
                HStack{
                    
                    Text("Dashboard")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
                    Spacer()
                    Button{
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 36,height: 36)
                            .foregroundStyle(Color(hex: 0x2C81FF))
                            .overlay{
                                Image("gear")
                                    .resizable()
                                    .frame(width: 26, height: 26)
                            }
                    }
                }
                .padding()
                .frame(height: 100)
                
                ScrollView{
                    GreetView()
                    VStack{
                        
                        HStack{
                            Text("Overview")
                                .fontWeight(.thin)
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(style: StrokeStyle())
                                .overlay{
                                    HStack {
                                        Text("23 Aug - 23 Sept")
                                            .font(.system(size: 12))
                                            .foregroundStyle(.black)
                                        Image("Time")
                                            .resizable()
                                            .frame(width: 16, height: 16)
                                        
                                    }
                                    .padding()
                                    
                                }
                            
                                .frame(width: 153, height: 28)
                                .foregroundStyle(Color(hex: 0xD8D8D8))
                            
                        }
                        .padding()
                        Chart{
                            ForEach(plots){plot in
                                LineMark(x: .value("Labels", plot.x), y: .value("Values", plot.y))
                                
                            }
                            
                            
                            ForEach(plots){plot in
                                AreaMark(x: .value("Labels", plot.x), y: .value("Values", plot.y))
                                    .foregroundStyle(linearGradient)
                            }
                            
                        }
                        .chartYAxis {
                            AxisMarks(position: .leading)
                        }
                        .padding()
                    }
                    .background(.white)
                    .padding()
                    
                    
                    ScrollView(.horizontal){
                        HStack{
                            CardView(icon: "mouseclick", title: String(apiResponseData.todayClicks), text:"Today's click")
                            
                            CardView(icon: "location", title: apiResponseData.topLocation, text:"Top Location")
                            
                            CardView(icon: "globe", title: apiResponseData.topSource, text:"Top Source")
                            
                        }
                        .padding(.horizontal)
                    }
                    
                    RectangleButtonView(alignmentCenter: true,icon: "price-boost", text: "View Analytics")
                    
                    VStack{
                        HStack{
                            CustomSegmentPickerView(selectedIndex: $selectedIndex, titles: titles)
                            
                            Button{
                                
                            } label: {
                                RoundedRectangle(cornerRadius: 5).stroke(style: StrokeStyle())
                                    .frame(width: 36,height: 36)
                                    .foregroundStyle(Color(hex: 0xD8D8D8))
                                    .overlay{
                                        Image("search")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                    }
                            }
                        }
                        .padding()
                        
                        VStack{
                            if self.selectedIndex == 0 {
                                ForEach(apiResponseData.data.topLinks){ item in
                                    LinkCardView(imageUrl: URL(string:item.originalImage)!, link: item.webLink, totalClicks: item.totalClicks, date: item.createdAt, title: item.title)
                                }
                                
                                RectangleButtonView(alignmentCenter: true,icon: "link", text: "View in link")
                            } else {
                                ForEach(apiResponseData.data.recentLinks){ item in
                                    LinkCardView(imageUrl: URL(string:item.originalImage)!, link: item.webLink, totalClicks: item.totalClicks, date: item.createdAt, title: item.title)
                                    
                                    
                                }
                                
                                EmptyView()
                            }

                        }
                
                                
                    }
                    
                    
                    
                    RectangleButton2View(alignmentCenter: false,icon: "whatsapp", text: "Talk with us", strokecolor: 0xB1E7B9, bgColor: 0xE0F2E3)
                    RectangleButton2View(alignmentCenter: false,icon: "exclamation", text: "Frequently Ask Question", strokecolor: 0xA2C7FF, bgColor: 0xE8F1FF)
                    
                    Spacer()
                    
                    
                }
                .background(Color(hex: 0xF5F5F5))
            .cornerRadius(25, corners: [.topLeft, .topRight])
            }
            
        }
        
        
    }
    
    
    
    
}

#Preview {
    ContentView()
}





