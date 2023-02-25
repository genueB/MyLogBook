//
//  WeatherClient.swift
//  MyLogBook
//
//  Created by 배진우 on 2023/02/21.
//

import Alamofire
import SwiftUI

struct WeatherClient {
    // 초단기 실황
    static func getPresentWeather(parameters: Parameters) {
        var url: String = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst"
        
        var request = AF.request(url,
                                 method: .get,
                                 parameters: parameters,
                                 encoding: URLEncoding.queryString)
            .responseDecodable(of: Weather.self) { response in
                switch response.result {
                case .success(let success):
                    print(success)
                case .failure(let error):
                    print(error)
                }
            }
    }
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
