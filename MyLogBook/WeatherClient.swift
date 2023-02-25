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
    static func getPresentWeather(parameters: Parameters, onComplete: @escaping ([WeatherItem]) -> Void) {
        var url: String = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst"
        
        var request = AF.request(url,
                                 method: .get,
                                 parameters: parameters,
                                 encoding: URLEncoding.default)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: Result.self) { response in
                switch response.result {
                case .success(let success):
                    onComplete(success.response.body.items.item)
                    print(success)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
