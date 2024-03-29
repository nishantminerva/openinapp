//
//  ViewModel.swift
//  Openinapp
//
//  Created by Nishant Minerva on 29/03/24.
//

import SwiftUI



class ViewModel: ObservableObject {
    @Published var openinappdata = Data(status: true, statusCode: 1, message: "", supportWhatsappNumber: "", extraIncome: 1.0, totalLinks: 9, totalClicks: 1, todayClicks: 1, topSource: "", topLocation: "", startTime: "", linksCreatedToday: 9, appliedCampaign: 0, data: DataClass(recentLinks: [], topLinks: [], favouriteLinks: [], overallURLChart: ["hi": 00]))
    
    func getRequest() async {
        let apiURL = "https://api.inopenapp.com/api/v1/dashboardNew"  // API URL
        let bearerToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"   // bearer token
        
        let url = URL(string: apiURL)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(bearerToken)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response")
                return
            }
            
            if let data = data {
                do {

                    let openinappdata = try JSONDecoder().decode(Data.self, from: data)
//                    print(openinappdata?.data.overallURLChart)
                    self.openinappdata = openinappdata
                } catch {
                    print("Error parsing JSON: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
        
    }

}
