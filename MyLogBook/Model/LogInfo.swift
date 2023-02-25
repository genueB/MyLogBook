//
//  LogInfo.swift
//  MyLogBook
//
//  Created by 배진우 on 2023/02/20.
//

import SwiftUI

struct LogInfo: Identifiable {
    var id: Int
    var logNumber: Int
    var logDate: String
    var location: String
    var resortName: String
    var pointName: String
    var weather: String
    var buddyName: String
    var suit: String
    var weight: Int
    
    init(id: Int = 1,
         logNumber: Int = 1,
         logDate: String = "2022.12.24",
         location: String = "강원도 양양",
         resortName: String = "남애스쿠버리조트",
         pointName: String = "징검다리",
         weather: String = "맑음",
         buddyName: String = "봄",
         suit: String = "웻 슈트",
         weight: Int = 8) {
        self.id = id
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
