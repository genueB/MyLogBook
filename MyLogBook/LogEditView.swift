//
//  LogEditView.swift
//  MyLogBook
//
//  Created by 배진우 on 2022/12/24.
//

import SwiftUI

class LogInfo: ObservableObject {
    @Published var logNumber: Int
    @Published var logDate: String
    @Published var location: String
    @Published var resortName: String
    @Published var pointName: String
    @Published var weather: String
    @Published var buddyName: String
    @Published var suit: String
    @Published var weight: Int
    
    init(logNumber: Int = 1,
         logDate: String = "2022.12.24",
         location: String = "강원도 양양",
         resortName: String = "남애스쿠버리조트",
         pointName: String = "징검다리",
         weather: String = "맑음",
         buddyName: String = "봄",
         suit: String = "웻 슈트",
         weight: Int = 8) {
        self.logNumber = logNumber
        self.logDate = logDate
        self.location = location
        self.resortName = resortName
        self.pointName = pointName
        self.weather = weather
        self.buddyName = buddyName
        self.suit = suit
        self.weight = weight
    }
}

struct LogEditView: View {
    @StateObject var logInfo = LogInfo()
    
    var body: some View {
        VStack(spacing: 0) {
            Text("로그 : \(logInfo.logNumber)")
            Text("날짜 : \(logInfo.logDate)")
            Text("지역 : \(logInfo.location)")
            Text("리조트 : \(logInfo.resortName)")
            Text("포인트 : \(logInfo.pointName)")
            Text("날씨 : \(logInfo.weather)")
            Text("버디 : \(logInfo.buddyName)")
            Text("슈트 : \(logInfo.suit)")
            Text("웨이트 : \(logInfo.weight)kg")
        }
    }
}

struct LogEditView_Previews: PreviewProvider {
    static var previews: some View {
        LogEditView()
    }
}
