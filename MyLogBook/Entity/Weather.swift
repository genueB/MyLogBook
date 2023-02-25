//
//  Weather.swift
//  MyLogBook
//
//  Created by 배진우 on 2023/02/25.
//

import SwiftUI

struct Result: Codable {
    var response: Response
}

struct Response: Codable {
    var header: Header
    var body: Weather
}

struct Header: Codable {
    var resultCode: String
    var resultMsg: String
}

struct Weather: Codable {
    var dataType: String
    var items: WeatherItems
}

struct WeatherItems: Codable {
    var item: [WeatherItem]
}

struct WeatherItem: Codable {
    var baseDate: String
    var baseTime: String
    var category: String
    var nx: Int
    var ny: Int
    var obsrValue: String
}
