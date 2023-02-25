//
//  MainView.swift
//  MyLogBook
//
//  Created by 배진우 on 2023/02/20.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var myLogBook: LogBook
    
    var body: some View {
        VStack(spacing: 0) {
            Text("MainView!")
            Text("오늘 날짜 : \(Date().getYMDDate())")
            Text("오늘 날씨")

            Text("최근 로그")
            Text("로그 : \(myLogBook.getLastLog().logNumber)")
            Text("날짜 : \(myLogBook.getLastLog().logDate)")
            Text("위치 : \(myLogBook.getLastLog().location)")
            Text("리조트 : \(myLogBook.getLastLog().resortName)")
        }
        .frame(maxHeight: .infinity)
        .onAppear {
            var parameters: [String: Any] = [:]
            parameters["serviceKey"] = "WNpEu2IyYmaVsTCWMykWHH76RQFOeL2slTaUepOjWyaSNmKDvs48B4rHtYQZSgP9SdR1WuEmObMLYbLDxYp4xg%3D%3D"
            parameters["dataType"] = "JSON"
            parameters["base_date"] = "20230223"
            parameters["base_time"] = "0600"
            parameters["nx"] = "55"
            parameters["ny"] = "125"
            
            WeatherClient.getPresentWeather(parameters: parameters)
        }
//        .task {
//            var parameters: [String: Any] = [:]
//            parameters["serviceKey"] = "WNpEu2IyYmaVsTCWMykWHH76RQFOeL2slTaUepOjWyaSNmKDvs48B4rHtYQZSgP9SdR1WuEmObMLYbLDxYp4xg%3D%3D"
//            parameters["dataType"] = "JSON"
//            parameters["base_date"] = 20230223
//            parameters["base_time"] = 0600
//            parameters["nx"] = 55
//            parameters["ny"] = 125
//
//            WeatherClient.getPresentWeather(parameters: parameters)
//        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
